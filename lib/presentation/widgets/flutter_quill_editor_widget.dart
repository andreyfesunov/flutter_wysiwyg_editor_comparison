import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_wysiwyg_editor_comparison/presentation/widgets/editor_result_table_widget.dart';
import 'package:markdown/markdown.dart';
import 'package:markdown_quill/markdown_quill.dart';

class FlutterQuillEditorWidget extends StatefulWidget {
  const FlutterQuillEditorWidget({super.key});

  @override
  State<FlutterQuillEditorWidget> createState() =>
      _FlutterQuillEditorWidgetState();
}

class _FlutterQuillEditorWidgetState extends State<FlutterQuillEditorWidget> {
  final QuillController _controller = QuillController.basic();
  final DeltaToMarkdown _mdConverter = DeltaToMarkdown();

  StreamSubscription<DocChange>? _stream;
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

    // Uses third-party libraries to parse quill_delta format:
    // - markdown_quill (https://pub.dev/packages/markdown_quill)
    // - markdown (https://pub.dev/packages/markdown)
    _stream = _controller.document.changes.listen((DocChange items) {
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
        QuillSimpleToolbar(controller: _controller),
        Expanded(
          child: QuillEditor.basic(
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
