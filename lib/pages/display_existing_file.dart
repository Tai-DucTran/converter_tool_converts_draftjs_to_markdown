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
          "key": "17o1n",
          "data": {},
          "text":
              "At the core of our agency is our people - a dedicated team of engineers, creative innovators, world-class futurists, operational experts and business partners. And we’re looking for motivated, ambitious team players to join us.",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "6q96s",
          "data": {},
          "text":
              "Our Senior Creatives are thinkers, makers and storytellers that use design/art to bring ideas to life. They lead projects into uncharted creative territories and synthesize new outcomes. They’re design fundamentalists that approach projects with both rational and innovative mindsets. They know that the only constant is change and embrace the unknown with maturity, empathy and tenacity.\n \nAs a Senior Creative (Art), you’ll be responsible for leading strategic and creative thinking across large systematic projects, utilsing new technologies to create unique experiences. We are looking for a mix of conceptual thinking, innovation, design craft and fearless leadership to create meaningful and memorable work.\n \n Here’s what you should know if you want to be a Senior Creative at WAN:\n \n You are:",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 16, "offset": 4},
            {"style": "BOLD", "length": 3, "offset": 784},
            {"style": "BOLD", "length": 8, "offset": 792},
            {"style": "ITALIC", "length": 9, "offset": 791},
            {"style": "UNDERLINE", "length": 9, "offset": 791}
          ]
        },
        {
          "key": "1rs98",
          "data": {},
          "text": "A natural leader, strategic and conceptual thinker.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "e1ai6",
          "data": {},
          "text":
              "Not just a stellar Designer but enjoy leading and mentoring those around you.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "b15ap",
          "data": {},
          "text":
              "A world-class Art Director with impeccable craft, comfortably and consistently superb in your thinking and execution across a range of visual styles and mediums.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "8fjdl",
          "data": {},
          "text":
              "Able to define strategic and creative points of view on systematic thinking, platform innovation, storytelling and brand.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "48ik",
          "data": {},
          "text":
              "A leader and collaborator. You will lead and work closely with other disciplines and have a broad understanding of design that goes beyond Visual Design.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "dp67q",
          "data": {},
          "text":
              "A master of your craft who can be hands-on when needed. You lead by example and inspire with your passion.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "2l94e",
          "data": {},
          "text":
              "Able to build strong relationships with colleagues and clients alike.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "66mh6",
          "data": {},
          "text":
              "Proactive and positive in your approach to work and those around you.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "dtqnr",
          "data": {},
          "text": "On any given day:",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 17, "offset": 0},
            {"style": "ITALIC", "length": 17, "offset": 0},
            {"style": "UNDERLINE", "length": 17, "offset": 0}
          ]
        },
        {
          "key": "8orc7",
          "data": {},
          "text":
              "Create digital products, design systems and narratives grounded in strategic thinking.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
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
          "key": "f24sh",
          "data": {},
          "text":
              "Work with C-suite leaders and visionaries to transform brands.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "dt73n",
          "data": {},
          "text":
              "Define business requirements, opportunities and translate strategic insights into customer-facing experiences.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "9pid0",
          "data": {},
          "text":
              "Lead, empower and inspire teams to create best-in-class experiences.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "7ksll",
          "data": {},
          "text":
              "Mentor design talent across projects, providing clear direction and actionable feedback.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "9mocp",
          "data": {},
          "text":
              "Concept and collaborate with Strategy, Visual Design, Copy, UX and Tech to push project objectives.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "fiv9b",
          "data": {},
          "text":
              "Provide direction in matters related to visual design, including user experience, user interface, product and service design.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "c2l48",
          "data": {},
          "text": "Identify creative opportunities for business growth.",
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
        {
          "key": "3qkev",
          "data": {},
          "text":
              "Are curious and look beyond the immediate ask to concept innovative solutions.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "77msm",
          "data": {},
          "text":
              "Have a positive attitude that fosters team camaraderie and believe that greatness can happen only when people with different skills and perspectives work together.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "aic95",
          "data": {},
          "text":
              "Persevere despite obstacles and have the ability to adapt on the fly.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "a6u5h",
          "data": {},
          "text":
              "Are able to lead multiple projects and delegate work effectively.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "798p6",
          "data": {},
          "text":
              "Have strong leadership skills, and enjoys mentoring and fostering growth of junior design talent.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "5hrkk",
          "data": {},
          "text":
              "Have impeccable design craft, conceptual thinking and creative flair.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "92m24",
          "data": {},
          "text":
              "Are able to think, make and effectively communicate ideas and outputs to colleagues and clients.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "cooq7",
          "data": {},
          "text":
              "Are relentlessly focused on crafting meaning and memorable experiences that add real value to people’s lives and measurably move businesses forward.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "6ktvh",
          "data": {},
          "text":
              "Are comfortable collaborating with people from different creative disciplines and teams.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "7moee",
          "data": {},
          "text":
              "Have a proven track record in both product and systematic work.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "c5jki",
          "data": {},
          "text":
              "Have an active creative and cultural life with the ability to form unique POVs.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "7io1b",
          "data": {},
          "text":
              "Are able to create and craft award winning and peer envy work.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "fbn1s",
          "data": {},
          "text": "You bring:",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 10, "offset": 0},
            {"style": "ITALIC", "length": 10, "offset": 0},
            {"style": "UNDERLINE", "length": 10, "offset": 0}
          ]
        },
        {
          "key": "2ri1n",
          "data": {},
          "text": "10+ years of experience in Product/Service/Visual Design",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "1qq8c",
          "data": {},
          "text":
              "A proven track record of leading clients, projects and teams across multiple industries",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "6it60",
          "data": {},
          "text":
              "The knowledge of what good strategy and design systems look like while being able to zoom out and see the broader picture, while connecting the dots to create a cohesive overall experience",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "345jr",
          "data": {},
          "text":
              "The ability to inspire, line manage and mentor Visual Designers",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "5997d",
          "data": {},
          "text":
              "Mastery in design tools, presentation and prototyping including Figma, Sketch, Adobe Creative Suite, InVision, Principle, Keynote and Google Slides",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "7ipqs",
          "data": {},
          "text": "What kind of person are you?",
          "type": "unstyled",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": [
            {"style": "BOLD", "length": 28, "offset": 0},
            {"style": "ITALIC", "length": 28, "offset": 0},
            {"style": "UNDERLINE", "length": 28, "offset": 0}
          ]
        },
        {
          "key": "4rhbc",
          "data": {},
          "text":
              "You are a go-getter! You have an ‘impossible is nothing’ attitude.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "2vd7g",
          "data": {},
          "text": "You also have a warm positive attitude",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "d1t39",
          "data": {},
          "text":
              "Good people skills for the difficult moments as well as the easy ones.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "eg6bm",
          "data": {},
          "text":
              "You have proven understanding of our business or very similar ones.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "32pi0",
          "data": {},
          "text":
              "You can often foresee upcoming issues and can discuss fairly with your CEO.",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
        },
        {
          "key": "342l7",
          "data": {},
          "text":
              "You are unfazed by a little pressure and enjoy the energy of a team.  ",
          "type": "unordered-list-item",
          "depth": 0,
          "entityRanges": [],
          "inlineStyleRanges": []
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
$markdownDataCompany
$markdownDataCulture
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
