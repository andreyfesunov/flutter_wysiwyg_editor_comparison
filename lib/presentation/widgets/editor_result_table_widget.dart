import 'package:flutter/material.dart';

class EditorResultTableWidget extends StatelessWidget {
  final String? mdContent;
  final String? htmlContent;

  const EditorResultTableWidget(
      {super.key, required this.mdContent, required this.htmlContent});

  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "HTML",
                      textAlign: TextAlign.center,
                    ))),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Markdown",
                      textAlign: TextAlign.center,
                    ))),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(htmlContent ?? ""))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(mdContent ?? ""))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
