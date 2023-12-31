import 'package:flutter/material.dart';
import 'package:learn_quill_flutter/constants/routes.dart';
import 'package:learn_quill_flutter/pages/display_existing_file.dart';

void main() {
  runApp(MaterialApp(
    title: 'New Project',
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData.dark(),
    home: const HomePage(),
    routes: {
      quillDisplayExistingFile: (context) => const MarkDownDisplay(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(quillDisplayExistingFile);
              },
              child: const Text(
                'Quill Display Existing File',
                style: TextStyle(fontSize: 25, color: Colors.deepOrange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
