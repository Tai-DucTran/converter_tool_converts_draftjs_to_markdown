// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer' as deve show log;

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class QuillDisplayExistingFile extends StatelessWidget {
  const QuillDisplayExistingFile({super.key});

  @override
  Widget build(BuildContext context) {
    final jobDescription = {
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
            {"style": "ITALIC", "length": 3, "offset": 31}
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
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 6, "offset": 8}
          ]
        }
      ],
      "entityMap": {}
    };
    // culture having image:
    final cultureJson = {
      "blocks": [
        {
          "key": "4if5j",
          "data": {},
          "text": "Who We Are",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 10, "offset": 0}
          ]
        },
        {
          "key": "aq1ja",
          "data": {},
          "text":
              "At Glints, personal and professional growth are just as important as business growth. That's why we created the Glints Culture Code: #RIIBCOH. It defines our values, is what guides our decisions and actions, and is what makes us special:",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 8, "offset": 133}
          ]
        },
        {
          "key": "al3qq",
          "data": {},
          "text":
              "Relentlessly Resourceful: Whatever it takes, just make it happen (ethically)",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 26, "offset": 0}
          ]
        },
        {
          "key": "eieej",
          "data": {},
          "text":
              "Integrity: Have courage, be guided by the truth, don’t be afraid",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 9, "offset": 0}
          ]
        },
        {
          "key": "bqh6l",
          "data": {},
          "text": "Impact: Missionaries, not mercenaries",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 6, "offset": 0}
          ]
        },
        {
          "key": "ef2n7",
          "data": {},
          "text": "Beginners’ Mindset: Stay humble, don’t be attached to ego",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 19, "offset": 0}
          ]
        },
        {
          "key": "7ioo4",
          "data": {},
          "text": "Customer Obsessed: Customers First",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 19, "offset": 0}
          ]
        },
        {
          "key": "d4oee",
          "data": {},
          "text":
              "Ownership: Care intensely about the mission and take responsibility",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 9, "offset": 0}
          ]
        },
        {
          "key": "2pc25",
          "data": {},
          "text": "High Standards: Dream big and deliver epic outcomes fast",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 15, "offset": 0}
          ]
        },
        {
          "key": "3mv7p",
          "data": {},
          "text": "Where We Work",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 13, "offset": 0}
          ]
        },
        {
          "key": "26g54",
          "data": {},
          "text":
              "Since Glints was officially launched in Singapore in 2015, we've rapidly grown our footprints across Greater Southeast Asia to operate in Singapore, Indonesia, Vietnam, Taiwan and Philippines.",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "bch5a",
          "data": {},
          "text": " ",
          "type": "atomic",
          "depth": 0,
          "entityRanges": [
            {"key": 0, "length": 1, "offset": 0}
          ],
          "inlineStyleRanges": []
        },
        {
          "key": "62t1",
          "data": {},
          "text": "",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        }
      ],
      "entityMap": {
        "0": {
          "data": {
            "src":
                "https://images.unsplash.com/photo-1525253086316-d0c936c814f8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80",
            "width": "auto",
            "height": "auto"
          },
          "type": "IMAGE",
          "mutability": "MUTABLE"
        }
      }
    };

    // description having external-link:
    final description = {
      "blocks": [
        {
          "key": "2cpbk",
          "data": {},
          "text": "Let’s Realize Human Potential.",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 30, "offset": 0},
            {"style": "ITALIC", "length": 29, "offset": 0}
          ]
        },
        {
          "key": "ba8m",
          "data": {},
          "text":
              "At Glints, we are building the #1 tech-enabled recruitment and career discovery platform in Southeast Asia that helps people and organizations realize their human potential.",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "50kg",
          "data": {},
          "text":
              "We have impacted many lives but there’s still plenty to be done. If you’re ready to grow and make an impact, you’ve come to the right place.",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 1, "offset": 64}
          ]
        },
        {
          "key": "bkqv9",
          "data": {},
          "text": "What is Glints?",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 15, "offset": 0}
          ]
        },
        {
          "key": "4mgav",
          "data": {},
          "text":
              "Glints is the leading talent ecosystem in Southeast Asia, with an enduring purpose of contributing to a world where people and organizations can realize their human potential.",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "1jkll",
          "data": {},
          "text":
              "Today, Glints is the most well-funded and well-capitalized startup in the talent recruitment space in Southeast Asia, with over US80M in total investments raised till date.",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "7tcqa",
          "data": {},
          "text":
              "Our tech-enabled approach to recruitment and career discovery connects more than 3 million candidates to their next dream opportunities. We have also supported more than 50,000 companies in finding top talent and doubling recruitment efficiency.",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "7n38u",
          "data": {},
          "text":
              "Our agility and firm hold on our core purpose and values have allowed us to remain resilient and thrive through tumultuous times.",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "7c6m",
          "data": {},
          "text":
              "In 2020, we were recognized by LinkedIn as one of the Top 10 Startups in Singapore. In 2022, we were featured in the top 20 of Nikkei-FT-Statista High-Growth Companies Asia-Pacific 2021 list. Moreover, we were also featured in the top 10 fastest-growing companies in Singapore by The Straits Times.",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "7pfm5",
          "data": {},
          "text": " ",
          "type": "atomic",
          "depth": 0,
          "entityRanges": [
            {"key": 0, "length": 1, "offset": 0}
          ],
          "inlineStyleRanges": []
        },
        {
          "key": "eskav",
          "data": {},
          "text": "",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "8bcnh",
          "data": {},
          "text": " ",
          "type": "atomic",
          "depth": 0,
          "entityRanges": [
            {"key": 1, "length": 1, "offset": 0}
          ],
          "inlineStyleRanges": []
        },
        {
          "key": "1mp77",
          "data": {},
          "text": "company website ",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [
            {"key": 2, "length": 15, "offset": 0}
          ],
          "inlineStyleRanges": []
        }
      ],
      "entityMap": {
        "0": {
          "data": {
            "src":
                "https://s3-ap-southeast-1.amazonaws.com/glints-dashboard/content/e8cb7bcaea5e0bb94924736ed401c404.png",
            "width": "auto",
            "height": "auto"
          },
          "type": "EMBEDDED_LINK",
          "mutability": "MUTABLE"
        },
        "1": {
          "data": {
            "src":
                "https://images.glints.com/unsafe/glints-dashboard.s3.amazonaws.com/company-banner-pic/8bbe67bc895d4460a408810139ace6f4.jpg",
            "width": "auto",
            "height": "auto",
            "alignment": "right"
          },
          "type": "IMAGE",
          "mutability": "MUTABLE"
        },
        "2": {
          "data": {
            "url": "https://glints.com/vn",
            "targetOption": "_blank",
          },
          "type": "LINK",
          "mutability": "MUTABLE"
        }
      }
    };

    List<String> jsonString = _convertBlocksToString(description);
    for (var element in jsonString) {
      deve.log(element);
    }
    final markdownData = '''
### Job Description
${jsonString[0]}
${jsonString[1]}
${jsonString[2]}
${jsonString[3]}
${jsonString[4]}
${jsonString[5]}
${jsonString[6]}
${jsonString[7]}
${jsonString[8]}
${jsonString[9]}
${jsonString[10]}
${jsonString[11]}
${jsonString[12]}
''';
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
          data: markdownData,
          styleSheet: MarkdownStyleSheet(
              h1: const TextStyle(
                color: Colors.yellowAccent,
              ),
              h3: const TextStyle(
                color: Colors.blue,
              ),
              a: const TextStyle(color: Colors.white)),
          onTapLink: (text, url, title) => launchUrl(Uri.parse(url!)),
        ),
      ),
    );
  }
}

enum _BlockStyle {
  unStyled,
  unorderedList,
  orderedList,
  // atomic,
}

_BlockStyle _getSentenceType(String type) {
  if (type == 'ordered-list-item') {
    return _BlockStyle.orderedList;
  } else if (type == 'unordered-list-item') {
    return _BlockStyle.unorderedList;
  } else {
    return _BlockStyle.unStyled;
  }
}

List<String> _convertBlocksToString(Map<String, dynamic> json) {
  final blocks = json['blocks'] as List<Map>;
  final entityMap = json['entityMap'] as Map;

  final List<String> content = [];

  for (var i = 0; i < blocks.length; i++) {
    final entityRanges = blocks[i]['entityRanges'] as List;
    final String curBlockContent = _addInlineStyle(blocks[i]);
    final curStyle = _getSentenceType(blocks[i]['type']);

    if (entityRanges.isEmpty) {
      switch (curStyle) {
        case _BlockStyle.unStyled:
          content.add('${curBlockContent.toString()}\n');
        case _BlockStyle.unorderedList:
          content.add('* ${curBlockContent.toString()}\n');
        case _BlockStyle.orderedList:
          const String defaultOrder = '1. ';
          content.add('$defaultOrder ${curBlockContent.toString()}\n');
      }
    } else {
      // Check keyEntity of Block, then link with entityMapKey
      final keyBlockEntity = entityRanges[0]["key"];
      final keyEnityMap = keyBlockEntity;
      final Map entityMapBlock = entityMap["$keyEnityMap"];
      final curEnityType = _getEnityMapType(entityMapBlock["type"]);

      final data = entityMapBlock["data"];

      switch (curEnityType) {
        case _EnityMapType.image:
          content.add('![](${data["src"]})');
        case _EnityMapType.embeddedLink:
          content.add('${data["src"]}');
        case _EnityMapType.link:
          content.add('[$curBlockContent](${data["url"]})');
      }
    }
  }

  content.add(entityMap.toString());

  return content;
}

String _addInlineStyle(Map<dynamic, dynamic> block) {
  final String text = block['text'];
  final List<dynamic> inlineStyleRanges = block['inlineStyleRanges'];

  // Re-organize the inlineStyleRanges by offset:
  if (inlineStyleRanges.length > 1) {
    inlineStyleRanges
        .sort((a, b) => (a["offset"] as int).compareTo(b["offset"] as int));
  }

  // Merge styles with equal "offset"
  List<Map<String, dynamic>> newInlineStyleRanges = [];
  for (int i = 0; i < inlineStyleRanges.length; i++) {
    if (i < inlineStyleRanges.length - 1 &&
        inlineStyleRanges[i]["offset"] == inlineStyleRanges[i + 1]["offset"]) {
      late int newRangesLenght = 0;
      final int firstInlineStyleLenght = inlineStyleRanges[i]["length"];
      final int secondInlineStyleLenght = inlineStyleRanges[i + 1]["length"];

      if (firstInlineStyleLenght >= secondInlineStyleLenght) {
        newRangesLenght = firstInlineStyleLenght;
      } else {
        newRangesLenght = secondInlineStyleLenght;
      }
      // Merge styles with equal "offset" and "length"
      newInlineStyleRanges.add({
        "style":
            "${inlineStyleRanges[i]["style"]} ${inlineStyleRanges[i + 1]["style"]}",
        "length": newRangesLenght,
        "offset": inlineStyleRanges[i]["offset"],
      });
      // Skip the next element as it has been merged
      i++;
    } else {
      // Add non-merged styles to the merged list
      newInlineStyleRanges.add(inlineStyleRanges[i]);
    }
  }
  deve.log('newInlineStyleRanges: ${newInlineStyleRanges.toString()}');

  final StringBuffer formattedText = StringBuffer();

  int currentOffset = 0;

  for (var styleRange in newInlineStyleRanges) {
    late String style = styleRange['style'];
    final int offset = styleRange['offset'];
    final int length = styleRange['length'];

    // Add the text before the style range
    formattedText.write(text.substring(currentOffset, offset));

    // Apply the style to the specified range of text
    final String styledText = text.substring(offset, offset + length);

    // Check style:
    var textFormatStyle = _textFormatStyle(
      style: style,
      styledText: styledText,
    );

    if (!textFormatStyle.toString().endsWith(' ')) {
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

// Implement [enityMap]:
enum _EnityMapType {
  image,
  embeddedLink,
  link,
}

_EnityMapType _getEnityMapType(String type) {
  if (type == 'IMAGE') {
    return _EnityMapType.image;
  } else if (type == 'EMBEDDED_LINK') {
    return _EnityMapType.embeddedLink;
  } else {
    return _EnityMapType.link;
  }
}
