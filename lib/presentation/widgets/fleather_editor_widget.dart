import 'dart:async';

import 'package:fleather/fleather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/quill_delta.dart' as quill;
import 'package:flutter_wysiwyg_editor_comparison/presentation/widgets/editor_result_table_widget.dart';
import 'package:markdown/markdown.dart';
import 'package:markdown_quill/markdown_quill.dart';

class FleatherEditorWidget extends StatefulWidget {
  const FleatherEditorWidget({super.key});

  @override
  State<FleatherEditorWidget> createState() => _FleatherEditorWidgetState();
}

class _FleatherEditorWidgetState extends State<FleatherEditorWidget> {
  final FleatherController _controller = FleatherController();
  final DeltaToMarkdown _mdConverter = DeltaToMarkdown();

  StreamSubscription<ParchmentChange>? _stream;
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

    _stream = _controller.document.changes.listen((ParchmentChange items) {
      var delta = quill.Delta.fromJson(_controller.document.toDelta().toJson());
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
        FleatherToolbar.basic(controller: _controller),
        Expanded(
          child: FleatherEditor(
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
