import 'dart:async';

import 'package:fleather/fleather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/quill_delta.dart' as quill;
import 'package:flutter_wysiwyg_editor_comparison/presentation/widgets/editor_result_table_widget.dart';
import 'package:markdown/markdown.dart';
import 'package:markdown_quill/markdown_quill.dart';
import 'package:parchment_to_html/parachment_to_html.dart';
import 'package:html2md/html2md.dart' as html2md;

class FleatherEditorWidget extends StatefulWidget {
  const FleatherEditorWidget({super.key});

  @override
  State<FleatherEditorWidget> createState() => _FleatherEditorWidgetState();
}

class _FleatherEditorWidgetState extends State<FleatherEditorWidget> {
  final FleatherController _controller = FleatherController();
  final ParchmentHtmlCodec _htmlConverter = const ParchmentHtmlCodec();

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

    // Uses third-party libraries to parse parchment_delta format:
    // - html2md           (https://pub.dev/packages/html2md)
    // - parchment_to_html (https://pub.dev/packages/parchment_to_html)
    _stream = _controller.document.changes.listen((ParchmentChange items) {
      var delta = _controller.document.toDelta();
      var html = _htmlConverter.encode(delta);
      var md = html2md.convert(html);

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
