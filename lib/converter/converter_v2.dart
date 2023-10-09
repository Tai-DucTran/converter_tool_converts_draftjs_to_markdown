import 'dart:developer' as deve show log;

import 'package:learn_quill_flutter/converter/models/markdown_format.dart';

enum _BlockStyle {
  unStyled,
  unorderedList,
  orderedList,
}

enum _EntityMapType {
  image,
  embeddedLink,
  link,
}

_EntityMapType _getEnityMapType(String type) {
  switch (type) {
    case 'IMAGE':
      return _EntityMapType.image;
    case 'EMBEDDED_LINK':
      return _EntityMapType.embeddedLink;
    default:
      return _EntityMapType.link;
  }
}

_BlockStyle _getSentenceType(String type) {
  switch (type) {
    case 'ordered-list-item':
      return _BlockStyle.orderedList;
    case 'unordered-list-item':
      return _BlockStyle.unorderedList;
    default:
      return _BlockStyle.unStyled;
  }
}

String convertBlocksToStringV2(Map<String, dynamic> json) {
  final blocks = json['blocks'] as List;
  final entityMap = json['entityMap'] as Map;

  final listOfContent = <String>[];

  for (var i = 0; i < blocks.length; i++) {
    final curBlock = blocks[i] as Map<String, dynamic>;
    final entityRanges = (blocks[i] as Map)['entityRanges'] as List;
    final blockType = (blocks[i] as Map)['type'] as String;
    final curStyle = _getSentenceType(blockType);

    //* If [_addInlineStyleV2] return (error), [curBlockContent] will return as text without any format style
    String curBlockContent;
    try {
      curBlockContent = _addInlineStyleV2(curBlock);
    } catch (e) {
      curBlockContent = curBlock['text'] as String;
    }

    if (entityRanges.isEmpty) {
      switch (curStyle) {
        case _BlockStyle.unStyled:
          listOfContent.add('$curBlockContent\n');
        case _BlockStyle.unorderedList:
          listOfContent.add('* $curBlockContent\n');
        case _BlockStyle.orderedList:
          const defaultOrder = '1. ';
          listOfContent.add('$defaultOrder $curBlockContent\n');
      }
    } else {
      // Check keyEntity of Block, then link with entityMapKey
      final keyBlockEntity = (entityRanges[0] as Map)['key'];
      final keyEnityMap = keyBlockEntity;
      final entityMapBlock = entityMap['$keyEnityMap'] as Map<String, dynamic>;
      final curEnityType = _getEnityMapType(entityMapBlock['type'] as String);

      final data = entityMapBlock['data'] as Map;

      switch (curEnityType) {
        case _EntityMapType.image:
          listOfContent.add('![](${data['src']})\n');
        case _EntityMapType.embeddedLink:
          listOfContent.add('${data['src']}\n');
        case _EntityMapType.link:
          listOfContent.add('[$curBlockContent](${data['url']})\n');
      }
    }
  }

  final content = listOfContent.join('\n');
  return content;
}

String _addInlineStyleV2(Map<String, dynamic> block) {
  final text = block['text'] as String;
  final inlineStyleRanges = block['inlineStyleRanges'] as List;
  final inlineStyleRangesLength = inlineStyleRanges.length;

  // Reorganize the inlineStyleRanges by increasing offset:
  if (inlineStyleRangesLength > 1) {
    inlineStyleRanges.sort(
      (a, b) =>
          ((a as Map)['offset'] as int).compareTo((b as Map)['offset'] as int),
    );
  }
  deve.log('inlineStyleRanges: $inlineStyleRanges');

  final markDownFormatList = <MarkDownFormat>[];

  for (final inlineStyleRange in inlineStyleRanges) {
    final inlineStyle = (
      style: (inlineStyleRange as Map)['style'] as String,
      offset: inlineStyleRange['offset'] as int,
      length: inlineStyleRange['length'] as int,
    );

    final endOffSet = inlineStyle.offset + inlineStyle.length;

    if (inlineStyle.length != 1) {
      final markDownFormat = _getMarkdownStyle(inlineStyle.style);

      markDownFormatList
        ..add(
          MarkDownFormat(
            format: markDownFormat,
            offset: inlineStyle.offset,
            offsetType: OffsetType.start,
          ),
        )
        ..add(
          MarkDownFormat(
            format: markDownFormat,
            offset: endOffSet,
            offsetType: OffsetType.end,
          ),
        );
    }
  }
  markDownFormatList.sort((a, b) => a.offset.compareTo(b.offset));
  deve.log('markDownFormatList: $markDownFormatList');

  // merge same offset and same lenght:
  final newMarkDownFormatList = <MarkDownFormat>[];
  for (var i = 0; i < markDownFormatList.length; i++) {
    final currentItem = markDownFormatList[i];
    if (newMarkDownFormatList.isNotEmpty &&
        currentItem.offset == newMarkDownFormatList.last.offset &&
        currentItem.offsetType == newMarkDownFormatList.last.offsetType) {
      // Handle UNDERLINE style for legacy JobDescription/Company Profile.
      // If has both style BOLD and UNDERLINE at same Offset and same Length
      //* [hasSameBoldAndUnderline]is true, remove one

      final hasSameBoldAndUnderline = currentItem.format == '**' &&
          currentItem.format == newMarkDownFormatList.last.format;
      final mergedItem = MarkDownFormat(
        format: !hasSameBoldAndUnderline
            ? (currentItem.format) + (newMarkDownFormatList.last.format)
            : currentItem.format,
        offset: currentItem.offset,
        offsetType: currentItem.offsetType,
      );

      newMarkDownFormatList
        ..removeLast()
        ..add(mergedItem);
    } else {
      newMarkDownFormatList.add(currentItem);
    }
  }

  //* Split the content into a list<words>
  final splitedText = text.split('').toList();
  deve.log('newMarkDownFormatList: $newMarkDownFormatList');
  deve.log('splitedText: $splitedText');
  deve.log('length: ${splitedText.length}');
  deve.log('text: ${text.length}');

  for (final style in newMarkDownFormatList) {
    final format = style.format;
    final offset = style.offset;
    final offsetType = style.offsetType;

    deve.log('offset == splitedText.length: ${offset == splitedText.length}');

    switch (offsetType) {
      case OffsetType.start:
        if (offset == 0) {
          splitedText.first = '$format${splitedText.first}';
        } else if (splitedText[offset] == ' ') {
          // splitedText.replaceRange(offset + 1, offset + 2,
          //     ['$format${splitedText[offset + 1]}']);
          splitedText[offset + 1] = '$format${splitedText[offset + 1]}';
        } else {
          splitedText[offset] = '$format${splitedText[offset]}';
        }
      case OffsetType.end:
        if (offset == splitedText.length) {
          if (splitedText.last != ' ') {
            splitedText.add(format);
          } else {
            splitedText
              ..removeLast()
              ..add(format);
          }
        } else if (splitedText[offset] == ' ') {
          // splitedText.replaceRange(
          //     offset - 1, offset, ['${splitedText[offset - 1]}$format']);
          splitedText[offset - 1] = '${splitedText[offset - 1]}$format';
        } else if (splitedText[offset - 1] == ' ' &&
            splitedText[offset + 1] != '') {
          splitedText[offset - 2] = '${splitedText[offset - 2]}$format';
        } else {
          splitedText[offset] = '$format${splitedText[offset]}';
        }
    }

    deve.log('splitedText before joining: $splitedText');
  }

  deve.log('splitedText before joining: $splitedText');

  final result = splitedText.join();
  deve.log('splitedText after joining: $result');

  return result;
}

class MarkdownException implements Exception {
  MarkdownException(this.message);
  final String message;

  @override
  String toString() => 'MarkdownException: $message';
}

enum FormattedTextStyle {
  bold,
  italic,
  underline,
}

enum OffsetType {
  start,
  end,
}

FormattedTextStyle _getFormattedTextStyle(String style) {
  if (style == 'BOLD') {
    return FormattedTextStyle.bold;
  }
  if (style == 'ITALIC') {
    return FormattedTextStyle.italic;
  } else {
    return FormattedTextStyle.underline;
  }
}

String _getMarkdownStyle(String style) {
  final formattedTextStyle = _getFormattedTextStyle(style);
  return switch (formattedTextStyle) {
    FormattedTextStyle.bold => '**',
    FormattedTextStyle.italic => '*',
    FormattedTextStyle.underline => '**',
  };
}
