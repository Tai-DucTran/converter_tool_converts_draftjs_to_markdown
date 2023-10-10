import 'package:learn_quill_flutter/converter/models/markdown_format.dart';

//* [convertBlocksToString]:
// - It will take json data and split [blocks] to small [block]s
// - Depending on the block's [style] and [entityRanges], it constructs the appropriate Markdown-style formatting for each block's content.
// - If the block has entity ranges (such as links or images), it retrieves the entity map data and formats the content accordingly.
// _ If [_addInlineStyle] is error, will return text without any format style

//* [_addInlineStyle]:
/// - processes inline style ranges within a block
/// 1. Comparing and reorganizing the inlineStyleRanges by increasing offset.
/// 2. Break down every inlineStyle into 2 [MarkDownFormat] based on [OffsetType.start] Or [OffsetType.end]
/// 3. Check if is there any [MarkDownFormat] has a same offset and same length, then merge those into one
///
/// Example:
/// - MarkdownFormat(format: **, offset: 0, offsetType: start)
/// - MarkdownFormat(format: *, offset: 0, offsetType: start)
/// merged & create a new [MarkDownFormat]:
/// - MarkdownFormat(format: ***, offset: 0, offsetType: start)
///
/// 4. Split the block content into a list<String>
/// 5. Insert [MarkDownFormat]in list<String> based on offset and [OffsetType]
/// 6. Join those items together

String convertDraftJsToMarkDown(Map<String, dynamic> json) {
  final blocks = json['blocks'] as List;
  final entityMap = json['entityMap'] as Map;

  final listOfContent = <String>[];

  for (var i = 0; i < blocks.length; i++) {
    final curBlock = blocks[i] as Map<String, dynamic>;
    final entityRanges = (blocks[i] as Map)['entityRanges'] as List;
    final blockType = (blocks[i] as Map)['type'] as String;
    final curStyle = _getSentenceType(blockType);

    /// If [_addInlineStyleV2] return (error), [curBlockContent] will return as text without any format style
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

  //* 1. Comparing and reorganizing the inlineStyleRanges by increasing offset.
  if (inlineStyleRangesLength > 1) {
    inlineStyleRanges.sort(
      (a, b) =>
          ((a as Map)['offset'] as int).compareTo((b as Map)['offset'] as int),
    );
  }
  final markDownFormatList = <MarkDownFormat>[];

  //* 2. Break down every inlineStyle into 2 [MarkDownFormat] based on [OffsetType.start] Or [OffsetType.end]
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

  //* 3. Check if is there any [MarkDownFormat] has a same offset and same length, then merge those into one
  final newMarkDownFormatList = <MarkDownFormat>[];
  for (var i = 0; i < markDownFormatList.length; i++) {
    final currentItem = markDownFormatList[i];
    if (newMarkDownFormatList.isNotEmpty &&
        currentItem.offset == newMarkDownFormatList.last.offset &&
        currentItem.offsetType == newMarkDownFormatList.last.offsetType) {
      // Handle UNDERLINE style for legacy JobDescription/Company Profile.
      // If has both style BOLD and UNDERLINE at same Offset and same Length
      // [hasSameBoldAndUnderline]is true, remove one

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

  //* 4. Split the block content into a list<String>
  final splitedText = text.split('').toList();
  for (final style in newMarkDownFormatList) {
    final format = style.format;
    final offset = style.offset;
    final offsetType = style.offsetType;

    //* 5. Insert [MarkDownFormat]in list<String> based on offset and [OffsetType]
    switch (offsetType) {
      case OffsetType.start:
        if (offset == 0) {
          splitedText.first = '$format${splitedText.first}';
        } else if (splitedText[offset] == ' ') {
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
          splitedText[offset - 1] = '${splitedText[offset - 1]}$format';
        } else if (splitedText[offset - 1] == ' ' &&
            splitedText[offset + 1] != '') {
          splitedText[offset - 2] = '${splitedText[offset - 2]}$format';
        } else {
          splitedText[offset] = '$format${splitedText[offset]}';
        }
    }
  }
  //* 6. Join those items together
  final result = splitedText.join();
  return result;
}

class MarkdownException implements Exception {
  MarkdownException(this.message);
  final String message;

  @override
  String toString() => 'MarkdownException: $message';
}

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

enum _FormattedTextStyle {
  bold,
  italic,
  underline,
}

enum OffsetType {
  start,
  end,
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

_FormattedTextStyle _getFormattedTextStyle(String style) {
  if (style == 'BOLD') {
    return _FormattedTextStyle.bold;
  }
  if (style == 'ITALIC') {
    return _FormattedTextStyle.italic;
  } else {
    return _FormattedTextStyle.underline;
  }
}

String _getMarkdownStyle(String style) {
  final formattedTextStyle = _getFormattedTextStyle(style);
  return switch (formattedTextStyle) {
    _FormattedTextStyle.bold => '**',
    _FormattedTextStyle.italic => '*',
    _FormattedTextStyle.underline => '**',
  };
}
