import 'dart:developer' as deve show log;

import 'package:learn_quill_flutter/models/inline_style.dart';
//* [convertBlocksToString]:
// - It will take json data and split [blocks] to small [block]s
// - Depending on the block's [style] and [entityRanges], it constructs the appropriate Markdown-style formatting for each block's content.
// - If the block has entity ranges (such as links or images), it retrieves the entity map data and formats the content accordingly.
// _ If [_addInlineStyle] is error, will return text without any format style

//* [_addInlineStyle]:
// - processes inline style ranges within a block
// - sorts and merges inline styles with the same offset
// - avoid conflicts

// A. Avoid the conflict with complex inlineStyleRanges and simplize these words be united style
// ex:
// "What do mobile engineers do?"
// "What 'do'[BOLD, UNDERLINE] 'mo'[BOLD]'bile'[BOLD, UNDERLINE, ITALIC] 'engineers'[BOLD, UNDERLINE] do?"
// [[{style: BOLD, length: 19, offset: 5}, {style: UNDERLINE, length: 19, offset: 5}, {style: ITALIC, length: 5, offset: 9}]
// after Merge styles above:
// newInlineStyleRanges = [{style: BOLD UNDERLINE, length: 19, offset: 5}, {style: ITALIC, length: 5, offset: 9}]
// newInlineStyleRanges[1] is belong to newInlineStyleRanges[0]
// remove newInlineStyleRanges[1]
// [{style: BOLD UNDERLINE, length: 19, offset: 5}]

// B. Avoid to render [spacing] but it have format style
// ex:
// In this sentence: "We're growing [spacing having format style, 'BOLD' here] fast"
// flutter will render: "We're growing ** fast"
// - applies the appropriate Markdown formatting based on the style

//* [_textFormatStyle]:
// - formats styled text according to Markdown conventions, handling 'BOLD', 'ITALIC', and 'UNDERLINE' styles.

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

String convertBlocksToString(Map<String, dynamic> json) {
  final blocks = json['blocks'] as List;
  final entityMap = json['entityMap'] as Map;

  final listOfContent = <String>[];

  for (var i = 0; i < blocks.length; i++) {
    final curBlock = blocks[i] as Map<String, dynamic>;
    final entityRanges = (blocks[i] as Map)['entityRanges'] as List;
    final blockType = (blocks[i] as Map)['type'] as String;
    final curStyle = _getSentenceType(blockType);

    //* If [_addInlineStyle] return (error), [curBlockContent] will return as text without any format style
    String curBlockContent;
    try {
      curBlockContent = _addInlineStyle(curBlock);
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

String _addInlineStyle(Map<String, dynamic> block) {
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

  final markDownFormatList = [];
  var currentOffset = 0;
  for (final inlineStyleRange in inlineStyleRanges) {
    final inlineStyle = InlineStyle(
      style: inlineStyleRange['style'],
      offset: inlineStyleRange['offset'],
      length: inlineStyleRange['length'],
    );

    final endOffSet = inlineStyle.offset + inlineStyle.length;
    final markDownFormat = _getMarkdownStyle(inlineStyle.style);

    markDownFormatList
      ..add(
        (
          markDownFormat: markDownFormat,
          offset: inlineStyle.offset,
          offsetType: 'start'
        ),
      )
      ..add(
        (
          markDownFormat: markDownFormat,
          offset: endOffSet,
          offsetType: 'end',
        ),
      );
  }
  markDownFormatList.sort((a, b) => a.offset.compareTo(b.offset));
  deve.log('markDownFormatList: $markDownFormatList');

  // merge same offset and same lenght:
  final newMarkDownFormatList = [];
  for (var i = 0; i < markDownFormatList.length; i++) {
    final currentItem = markDownFormatList[i];
    if (newMarkDownFormatList.isNotEmpty &&
        currentItem.offset == newMarkDownFormatList.last.offset &&
        currentItem.offsetType == newMarkDownFormatList.last.offsetType) {
      final mergedItem = (
        markDownFormat: (currentItem.markDownFormat) +
            (newMarkDownFormatList.last.markDownFormat),
        offset: currentItem.offset,
        offsetType: currentItem.offsetType,
      );
      newMarkDownFormatList.removeLast();
      newMarkDownFormatList.add(mergedItem);
    } else {
      newMarkDownFormatList.add(currentItem);
    }
  }
  deve.log('newMarkDownFormatList: $newMarkDownFormatList');

  // add markdownFormat to text:
  final formattedText = StringBuffer();
  formattedText.write(text.substring(currentOffset));
  return formattedText.toString();
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



  // // merge same offset and same lenght:
  // final newMarkDownFormatList = [];
  // for (var i = 0; i < markDownFormatList.length; i++) {
  //   final currentItem = markDownFormatList[i];
  //   deve.log('currentItem: $currentItem');

  //   if (newMarkDownFormatList.isNotEmpty &&
  //       currentItem.offset == newMarkDownFormatList.last.offset &&
  //       currentItem.offsetType == newMarkDownFormatList.last.offsetType) {
  //     final mergedItem = (
  //       format: currentItem.format + newMarkDownFormatList.last.format,
  //       offset: currentItem.offset,
  //       offsetType: currentItem.offsetType,
  //     );
  //     newMarkDownFormatList.removeLast();
  //     newMarkDownFormatList.add(mergedItem);
  //   } else {
  //     newMarkDownFormatList.add(currentItem);
  //   }
  // }
  // deve.log('newMarkDownFormatList: $newMarkDownFormatList');