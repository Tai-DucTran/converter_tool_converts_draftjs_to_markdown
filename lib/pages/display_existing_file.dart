import 'dart:developer' as deve show log;

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:learn_quill_flutter/utills/converter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:email_validator/email_validator.dart';

class MarkDownDisplay extends StatelessWidget {
  const MarkDownDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final jobDescription = {
      "blocks": [
        {
          "key": "capve",
          "data": {},
          "text":
              "WEALLNET is a brand new experience agency that exists to reimagine what an experience can be. We do that by pushing the boundaries of what’s possible in every format — virtual, live or hybrid. Born out of smart insights and built creatively with a content-first approach, our vision is imaginative and engaging, innovative beyond expectation, and flawlessly executed. Each and every day we are driven to do one thing: Live Extraordinary.  ",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 8, "offset": 0},
            {"style": "BOLD", "length": 4, "offset": 418},
            {"style": "BOLD", "length": 14, "offset": 423},
            {"style": "ITALIC", "length": 4, "offset": 418},
            {"style": "ITALIC", "length": 15, "offset": 423},
            {"style": "UNDERLINE", "length": 13, "offset": 423}
          ]
        },
        {
          "key": "5vn8d",
          "data": {},
          "text":
              "Structure narratives for client presentations and push systematic design work to drive impact and creative edge.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "fn1ut",
          "data": {},
          "text": "You’re the right fit if you:",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 28, "offset": 0},
            {"style": "UNDERLINE", "length": 28, "offset": 0},
            {"style": "ITALIC", "length": 28, "offset": 0}
          ]
        },
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

    String markdownDataJob = convertBlocksToString(jobDescription);
    String markdownDataCompany = convertBlocksToString(description);
    String markdownDataCulture = convertBlocksToString(cultureJson);

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
$markdownDataJob
''',
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
