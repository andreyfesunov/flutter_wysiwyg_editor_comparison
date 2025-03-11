import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'presentation/screens/editor_tabs_screen.dart';

void main() {
  runApp(const EditorComparisonApp());
}

class EditorComparisonApp extends StatelessWidget {
  const EditorComparisonApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Flutter MD/HTML Editor Comparison';

    return MaterialApp(
      title: title,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        FlutterQuillLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: const EditorTabsScreen(),
    );
  }
}
