import 'dart:convert';
import 'dart:developer' as deve show log;

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class QuillDisplayExistingFile extends StatelessWidget {
  const QuillDisplayExistingFile({super.key});

  @override
  Widget build(BuildContext context) {
    final parsedJson = {
      "blocks": [
        {
          "key": "dfm6j",
          "data": {},
          "text": "Job description",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 15, "offset": 0}
          ]
        },
        {
          "key": "6o7kf",
          "data": {},
          "text":
              "Join the Mobile development team and implement iOS and Android applications according to customer's requirements.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "UNDERLINE", "length": 15, "offset": 47},
            {"style": "ITALIC", "length": 15, "offset": 47}
          ]
        },
        {
          "key": "c9037",
          "data": {},
          "text":
              "Develop and maintain the application, fix bugs, and design new functions as required.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "20ad3",
          "data": {},
          "text": "Maintain the highest code quality",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 12, "offset": 13}
          ]
        },
        {
          "key": "95on6",
          "data": {},
          "text": "Find the optimal solutions for the problem.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 3, "offset": 5},
            {"style": "BOLD", "length": 4, "offset": 31},
            {"style": "UNDERLINE", "length": 9, "offset": 17},
            {"style": "ITALIC", "length": 4, "offset": 31}
          ]
        },
        {
          "key": "etql0",
          "data": {},
          "text": "Your skills and experience",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 26, "offset": 0}
          ]
        },
        {
          "key": "ksoq",
          "data": {},
          "text": "Graduated from College - University or IT training schools;",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 12, "offset": 10},
            {"style": "UNDERLINE", "length": 12, "offset": 10}
          ]
        },
        {
          "key": "5u2lj",
          "data": {},
          "text":
              "Minimum 1-year experience with Flutter application programming;",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "1a9c0",
          "data": {},
          "text": "Experience with Flutter (Dart);",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "sc5c",
          "data": {},
          "text":
              "Progressive, eager to learn, and willing to listen to suggestions for improvement;",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "6nnmj",
          "data": {},
          "text": "Why you'll love working here.",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 28, "offset": 0}
          ]
        },
        {
          "key": "4miiv",
          "data": {},
          "text": "13th month salary.",
          "type": "ordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "5buiv",
          "data": {},
          "text": "Bonus KPI/Performance.",
          "type": "ordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "6mb4k",
          "data": {},
          "text": "Extremely open working environment.",
          "type": "ordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 35, "offset": 0}
          ]
        },
        {
          "key": "33bi8",
          "data": {},
          "text": "Work with all the newest technologies.",
          "type": "ordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "n4f0",
          "data": {},
          "text": "Career orientation support.",
          "type": "ordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "UNDERLINE", "length": 18, "offset": 0},
            {"style": "BOLD", "length": 18, "offset": 0}
          ]
        },
        {
          "key": "e1g9h",
          "data": {},
          "text": "Reward holidays / Tet.",
          "type": "ordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "67env",
          "data": {},
          "text": "Holiday events.",
          "type": "ordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        }
      ],
      "entityMap": {}
    };

    List<String> jsonString = _convertBlocksToString(parsedJson);
    for (var element in jsonString) {
      deve.log(element);
    }

    final jsonElement = {
      "key": "95on6",
      "data": {},
      "text": "Find the optimal solutions for the problem.",
      "type": "unordered-list-item",
      "depth": 0,
      "entityRanges": [],
      "inlineStyleRanges": [
        {"style": "BOLD", "length": 3, "offset": 5},
        {"style": "BOLD", "length": 4, "offset": 31},
        {"style": "UNDERLINE", "length": 9, "offset": 17},
        // {"style": "ITALIC", "length": 4, "offset": 31}
      ]
    };

    final formattedText = formatStyledText(jsonElement);
    deve.log(formattedText);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Existing Text'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Markdown(
          data: '''
# Heading h1
## Heading h2
*This text will be italic*
* Sentence 1
* Sentence 2
* Sentence 3
* Sentence 4
* Sentence 5: A very long *sentence* to test how it will display on the screen\n

### Job Description
${jsonString[0]}
${jsonString[1]}
${jsonString[2]}

### Job Descript (formatted text)
$formattedText
''',
          styleSheet: MarkdownStyleSheet(
            h1: const TextStyle(
              color: Colors.yellowAccent,
            ),
            h3: const TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

List<String> _convertBlocksToString(Map<String, dynamic> json) {
  final blocks = json['blocks'] as List<Map>;

  final List<String> blockStrings = [];

  for (var block in blocks) {
    final String tempBlock = block['text'];
    if (tempBlock.toLowerCase().contains('job description')) {
      continue;
    }

    if (block['type'] != 'unordered-list-item') {
      blockStrings.add('${tempBlock.toString()}\n');
    } else {
      blockStrings.add('* ${tempBlock.toString()}\n');
    }
  }

  return blockStrings;
}

String formatStyledText(Map<String, dynamic> jsonData) {
  final String text = jsonData['text'];
  final List<dynamic> inlineStyleRanges = jsonData['inlineStyleRanges'];

  // Re-organize the inlineStyleRanges by offset:
  if (inlineStyleRanges.length > 1) {
    inlineStyleRanges
        .sort((a, b) => (a["offset"] as int).compareTo(b["offset"] as int));
  }
  deve.log('reorder inlineStyleRange: ${inlineStyleRanges.toString()}');

  final StringBuffer formattedText = StringBuffer();

  int currentOffset = 0;

  for (var styleRange in inlineStyleRanges) {
    final String style = styleRange['style'];
    final int offset = styleRange['offset'];
    final int length = styleRange['length'];

    late Map<String, Object> preStyleAndOffset = {
      "style": '',
      "offset": 0,
    };
    final Map<String, Object> curStyleAndOffset = {
      "style": styleRange['style'],
      "offset": styleRange['offset'],
    };

    // Add the text before the style range
    formattedText.write(text.substring(currentOffset, offset));

    // Apply the style to the specified range of text
    final String styledText = text.substring(offset, offset + length);

    // Check style:
    final textFormatStyle = _textFormatStyle(
      style: style,
      styledText: styledText,
    );

    // Add the [formatText]
    formattedText.write(textFormatStyle);

    currentOffset = offset + length;
    preStyleAndOffset = curStyleAndOffset;
    deve.log(preStyleAndOffset.toString());
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
  // Markdown haven't supported underline yet
  if (style == 'BOLD' || style == 'UNDERLINE') {
    return '**$styledText**';
  } else if (style == 'ITALIC') {
    return '*$styledText*';
  } else {
    return styledText;
  }
}
