import 'dart:developer' as deve show log;
//* [convertBlocksToString]:
// - It will take json data and split [blocks] to small [block]s
// - Depending on the block's [style] and [entityRanges], it constructs the appropriate Markdown-style formatting for each block's content.
// - If the block has entity ranges (such as links or images), it retrieves the entity map data and formats the content accordingly.

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
    final curBlockContent = _addInlineStyle(curBlock);
    final curStyle = _getSentenceType(blockType);

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

  deve.log('content: $content');

  return content;
}

String _addInlineStyle(Map<String, dynamic> block) {
  final text = block['text'] as String;
  final inlineStyleRanges = block['inlineStyleRanges'] as List;

  // Reorganize the inlineStyleRanges by increasing offset:
  if (inlineStyleRanges.length > 1) {
    inlineStyleRanges.sort(
      (a, b) =>
          ((a as Map)['offset'] as int).compareTo((b as Map)['offset'] as int),
    );
  }

  deve.log('Reorganize inlineStyleRanges: $inlineStyleRanges');

  // Merge styles with equal "offset" to avoid the conflict
  final newInlineStyleRanges = <Map<String, dynamic>>[];
  for (var i = 0; i < inlineStyleRanges.length; i++) {
    if (i < inlineStyleRanges.length - 1) {
      final curInlineStyleRanges = inlineStyleRanges[i] as Map<String, dynamic>;
      final nexInlineStyleRanges =
          inlineStyleRanges[i + 1] as Map<String, dynamic>;

      if (curInlineStyleRanges['offset'] == nexInlineStyleRanges['offset']) {
        late var newRangesLenght = 0;
        final firstInlineStyleLenght = curInlineStyleRanges['length'] as int;
        final secondInlineStyleLenght = nexInlineStyleRanges['length'] as int;

        if (firstInlineStyleLenght >= secondInlineStyleLenght) {
          newRangesLenght = firstInlineStyleLenght;
        } else {
          newRangesLenght = secondInlineStyleLenght;
        }
        // Merge styles if those equal "offset" and "length"
        newInlineStyleRanges.add({
          'style':
              "${curInlineStyleRanges["style"]} ${nexInlineStyleRanges["style"]}",
          'length': newRangesLenght,
          'offset': curInlineStyleRanges['offset'],
        });

        i++;
      }
    } else {
      // Add non-merged styles to the merged list
      final curInlineStyleRanges = inlineStyleRanges[i] as Map<String, dynamic>;
      newInlineStyleRanges.add(curInlineStyleRanges);
    }

    deve.log('newInlineStyleRanges: $newInlineStyleRanges');
  }

  //* A. Avoid the conflict with complex inlineStyleRanges and simplize these words be united style
  if (newInlineStyleRanges.length >= 2) {
    for (var i = 0; i < newInlineStyleRanges.length; i++) {
      if (_doesBelong(newInlineStyleRanges[i], newInlineStyleRanges[i + 1])) {
        newInlineStyleRanges.removeAt(i + 1);
      }
      i++;
    }
  }
  deve.log('A. Avoid conflict newInlineStyleRanges: $newInlineStyleRanges');

  final formattedText = StringBuffer();

  var currentOffset = 0;
  for (final styleRange in newInlineStyleRanges) {
    late final style = styleRange['style'] as String;
    final offset = styleRange['offset'] as int;
    final length = styleRange['length'] as int;

    // Add the text before the style range
    formattedText.write(text.substring(currentOffset, offset));

    // Apply the style to the specified range of text
    final styledText = text.substring(offset, offset + length);

    // Check style:
    var textFormatStyle = _textFormatStyle(
      style: style,
      styledText: styledText,
    );

    if (!textFormatStyle.endsWith(' ')) {
      textFormatStyle = '$textFormatStyle\n';
    }

    // Add the [formatText]
    if (!formattedText.toString().endsWith(' ')) {
      formattedText.write('');
    }

    // Add the [formatText]
    formattedText.write(textFormatStyle);

    currentOffset = offset + length;
  }

  // Add the remaining text after the last style range
  formattedText.write(text.substring(currentOffset));

  return formattedText.toString();
}

String _textFormatStyle({
  required String style,
  required String styledText,
}) {
//* B. Avoid to render [spacing] but it have format style
  if (styledText == ' ') {
    return '';
  }
  final newStyledText = styledText.trim();

  // Markdown haven't supported underline yet. If style is UNDERLINE, it will be replace with BOLD
  if (style == 'BOLD' || style == 'UNDERLINE') {
    return '**$newStyledText**';
  } else if (style == 'ITALIC') {
    return '*$newStyledText*';
  } else if (style == 'BOLD ITALIC' ||
      style == 'ITALIC BOLD' ||
      style == 'UNDERLINE ITALIC' ||
      style == 'ITALIC UNDERLINE') {
    return '***$newStyledText***';
  } else if (style == 'BOLD UNDERLINE' || style == 'UNDERLINE BOLD') {
    return '**$newStyledText**';
  } else {
    return newStyledText;
  }
}

bool _doesBelong(Map<String, dynamic> parent, Map<String, dynamic> child) {
  final parentStart = parent['offset'] as int;
  final parentEnd = parentStart + (parent['length'] as int);

  final childStart = child['offset'] as int;
  final childEnd = childStart + (child['length'] as int);

  return childStart >= parentStart && childEnd <= parentEnd;
}

class MarkdownException implements Exception {
  MarkdownException(this.message);
  final String message;

  @override
  String toString() => 'MarkdownException: $message';
}
