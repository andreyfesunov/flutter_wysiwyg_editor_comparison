import 'package:flutter/material.dart';
import 'package:flutter_wysiwyg_editor_comparison/presentation/widgets/editor_result_table_widget.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:remodl_rte/remodl_rte.dart';

class RemodlRichTextEditorWidget extends StatefulWidget {
  const RemodlRichTextEditorWidget({super.key});

  @override
  State<RemodlRichTextEditorWidget> createState() =>
      _RemodlRichTextEditorWidgetState();
}

class _RemodlRichTextEditorWidgetState
    extends State<RemodlRichTextEditorWidget> {
  late final HtmlEditor _editor;
  late final HtmlEditorController _controller;

  String? mdContent;
  String? htmlContent;

  _RemodlRichTextEditorWidgetState() {
    _controller = HtmlEditorController(
        callbacks: Callbacks(onChangeContent: (String? html) {
      // Uses third-party libraries to parse html format:
      // - html2md           (https://pub.dev/packages/html2md)
      var md = html2md.convert(html ?? "");

      updateContent(md, html);
    }));

    _editor = HtmlEditor(
      controller: _controller,
    );
  }

  void updateContent(String? newMdContent, String? newHtmlContent) {
    setState(() {
      mdContent = newMdContent;
      htmlContent = newHtmlContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _editor,
        ),
        Expanded(
            child: EditorResultTableWidget(
                mdContent: mdContent, htmlContent: htmlContent))
      ],
    );
  }
}
