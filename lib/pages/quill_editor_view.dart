import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class QuillEditorView extends StatefulWidget {
  const QuillEditorView({super.key});

  @override
  State<QuillEditorView> createState() => _QuillEditorViewState();
}

class _QuillEditorViewState extends State<QuillEditorView> {
  @override
  Widget build(BuildContext context) {
    QuillController controller = QuillController.basic();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quill Editor'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          QuillToolbar.basic(
            controller: controller,
            multiRowsDisplay: false,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: QuillEditor.basic(
                controller: controller,
                readOnly: false, // true for view only mode
              ),
            ),
          )
        ],
      ),
    );
  }
}
