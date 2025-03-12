import 'package:flutter/material.dart';
import 'package:flutter_wysiwyg_editor_comparison/presentation/widgets/editor_result_table_widget.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:html2md/html2md.dart' as html2md;

class HtmlEditorEnhancedWidget extends StatefulWidget {
  const HtmlEditorEnhancedWidget({super.key});

  @override
  State<HtmlEditorEnhancedWidget> createState() =>
      _HtmlEditorEnhancedWidgetState();
}

class _HtmlEditorEnhancedWidgetState extends State<HtmlEditorEnhancedWidget> {
  late final HtmlEditor _editor;
  final HtmlEditorController _controller = HtmlEditorController();

  String? mdContent;
  String? htmlContent;

  _HtmlEditorEnhancedWidgetState() {
    _editor = HtmlEditor(
        controller: _controller,
        callbacks: Callbacks(onChangeContent: (String? html) {
          var md = html2md.convert(html ?? "");

          updateContent(md, html);
        }));
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
