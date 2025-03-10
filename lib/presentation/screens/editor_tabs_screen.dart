import 'package:flutter/material.dart';
import 'package:flutter_wysiwyg_editor_comparison/presentation/widgets/flutter_quill_editor_widget.dart';

class EditorTabsScreen extends StatelessWidget {
  const EditorTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MD/HTML Editors'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'flutter_quill'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: FlutterQuillEditorWidget()),
          ],
        ),
      ),
    );
  }
}
