// ignore_for_file: unused_import

import 'dart:developer' as deve show log;
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class OptimizeMarkdown extends StatelessWidget {
  const OptimizeMarkdown({super.key});

  @override
  Widget build(BuildContext context) {
    const markdownData = '''
### Job Description
**Job description**    
* Join the Mobile development team and implement ***iOS and Android***
applications according to customer's requirements.
* Develop and maintain the application, fix bugs, and design new functions as required.  
* Maintain the **highest code** quality
* Find **the** optimal **solutions** for ***the*** problem.

**Your skills and experience**
* Graduated from College - University or IT training schools;
* Minimum 1-year experience with Flutter application programming; 
* Experience with Flutter (Dart);
* Progressive, eager to learn, and willing to listen to suggestions for improvement;
      
**Why you'll love working here**
1.  13th month salary.
1.  Bonus KPI/Performance.
1.  **Extremely open working environment.**
1.  Work with all the newest technologies.
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
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Markdown(
          data: markdownData,
        ),
      ),
    );
  }
}
