import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_wysiwyg_editor_comparison/presentation/widgets/editor_result_table_widget.dart';
import 'package:markdown/markdown.dart';
import 'package:markdown_quill/markdown_quill.dart';

class FlutterQuillEditorWidget extends StatefulWidget {
  const FlutterQuillEditorWidget({super.key});

  @override
  State<FlutterQuillEditorWidget> createState() => _FlutterQuillEditorState();
}

class _FlutterQuillEditorState extends State<FlutterQuillEditorWidget> {
  final quill.QuillController _controller = quill.QuillController.basic();
  final DeltaToMarkdown _mdConverter = DeltaToMarkdown();

  StreamSubscription<quill.DocChange>? _stream;
  String? mdContent;
  String? htmlContent;

  void updateContent(String? newMdContent, String? newHtmlContent) {
    setState(() {
      mdContent = newMdContent;
      htmlContent = newHtmlContent;
    });
  }

  @override
  void initState() {
    super.initState();

    _stream = _controller.document.changes.listen((quill.DocChange items) {
      var delta = _controller.document.toDelta();
      var md = _mdConverter.convert(delta);
      var html = markdownToHtml(md);

      updateContent(md, html);
    });
  }

  @override
  void dispose() {
    _stream?.cancel();

    super.dispose();
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
        Expanded(
            child: EditorResultTableWidget(
                mdContent: mdContent, htmlContent: htmlContent))
      ],
    );
  }
}
