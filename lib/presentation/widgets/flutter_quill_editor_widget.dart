import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class FlutterQuillEditorWidget extends StatefulWidget {
  const FlutterQuillEditorWidget({super.key});

  @override
  State<quill.QuillEditor> createState() => _FlutterQuillEditorState();
}

class _FlutterQuillEditorState extends State<quill.QuillEditor> {
  final quill.QuillController _controller = quill.QuillController.basic();
  String _textOutput = '';

  void _extractText() {
    setState(() {
      _textOutput = _controller.document.toPlainText();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        quill.QuillSimpleToolbar(controller: _controller),
        Expanded(
          child: quill.QuillEditor.basic(
            controller: _controller,
          ),
        ),
        ElevatedButton(
          onPressed: _extractText,
          child: const Text('Get Text'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Result:\n$_textOutput'),
        ),
      ],
    );
  }
}
