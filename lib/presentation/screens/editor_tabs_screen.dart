import 'package:flutter/material.dart';
import 'package:flutter_wysiwyg_editor_comparison/presentation/widgets/fleather_editor_widget.dart';
import 'package:flutter_wysiwyg_editor_comparison/presentation/widgets/flutter_quill_editor_widget.dart';

class EditorTabsScreen extends StatelessWidget {
  const EditorTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MD/HTML Editors'),
          bottom: const TabBar(
            tabs: [Tab(text: "flutter_quill"), Tab(text: "fleather")],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: FlutterQuillEditorWidget()),
            Center(child: FleatherEditorWidget())
          ],
        ),
      ),
    );
  }
}
