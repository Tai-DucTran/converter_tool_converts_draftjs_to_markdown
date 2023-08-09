import 'dart:developer' as deve show log;

enum _BlockStyle {
  unStyled,
  unorderedList,
  orderedList,
  // atomic,
}

enum _EnityMapType {
  image,
  embeddedLink,
  link,
}

_EnityMapType _getEnityMapType(String type) {
  switch (type) {
    case 'IMAGE':
      return _EnityMapType.image;
    case 'EMBEDDED_LINK':
      return _EnityMapType.embeddedLink;
    default:
      return _EnityMapType.link;
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
  final blocks = (json['blocks'] as List).cast<Map<String, dynamic>>();
  final entityMap = json['entityMap'] as Map;

  final listOfContent = <String>[];

  for (var i = 0; i < blocks.length; i++) {
    final curBlock = blocks[i];
    final entityRanges = blocks[i]['entityRanges'] as List;
    final blockType = blocks[i]['type'] as String;
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
        case _EnityMapType.image:
          listOfContent.add('![](${data['src']})');
        case _EnityMapType.embeddedLink:
          listOfContent.add('${data['src']}');
        case _EnityMapType.link:
          listOfContent.add('[$curBlockContent](${data['url']})');
      }
    }
  }

  final content = listOfContent.join('\n');

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
  }
  deve.log('newInlineStyleRanges: $newInlineStyleRanges');

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
    formattedText.write(textFormatStyle);

    currentOffset = offset + length;
  }

  // Add the remaining text after the last style range
  formattedText.write(text.substring(currentOffset));

  return formattedText.toString();
  // return inlineStyleRanges.toString();
}

String _textFormatStyle({
  required String style,
  required String styledText,
}) {
  // Avoid to render empty text but having format
  if (styledText == ' ') {
    return '';
  }
  final newStyledText = styledText.trimRight();

  // Markdown haven't supported underline yet
  if (style == 'BOLD' || style == 'UNDERLINE') {
    return '**$newStyledText**';
  } else if (style == 'ITALIC') {
    return '*$newStyledText*';
  } else if (style == 'BOLD ITALIC' ||
      style == 'ITALIC BOLD' ||
      style == 'UNDERLINE ITALIC' ||
      style == 'ITALIC UNDERLINE') {
    return '***$newStyledText***';
  } else {
    return newStyledText;
  }
}
