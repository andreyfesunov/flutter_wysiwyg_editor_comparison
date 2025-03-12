# Flutter WYSIWYG Editor Comparison

This repository is a project written in Flutter 3.29.1 that compares various Markdown and HTML editors. The main goal is to evaluate and display different editors within a Flutter application, providing the ability to switch between them using tabs.

## Editors Included:
- [flutter_quill](https://pub.dev/packages/flutter_quill)
- [fleather](https://pub.dev/packages/fleather)

## Comparison Result

| Library                                                 | Format                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Editor                                                                                                                                                                                                                                                                                                                                                    |
|---------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [flutter_quill](https://pub.dev/packages/flutter_quill) | ❌️ Uses it's own format for storing data - Delta, so you need to adapt your code on other platforms for it (or translate from Delta to HTML/MD, which brings loses). I've used [markdown_quill](https://pub.dev/packages/markdown_quill) to parse Quill Delta to MD, then [markdown](https://pub.dev/packages/markdown) to transform MD to HTML. ⚠️ This approach is unstable, allows for colossal losses even on simple markup, and is used for educational purposes only. | ✅️ A feature-rich WYSIWYG editor. If you are starting development with a Flutter app and don't care about the storage format, this is a great option for you.                                                                                                                                                                                             |
| [fleather](https://pub.dev/packages/fleather)           | ❌ Uses [Parchment Delta](https://pub.dev/packages/parchment_delta) for storing data about document, so you need to adapt your code on other platforms for it (or translate from Delta to HTML/MD, which brings loses). I've used [parchment_to_html](https://pub.dev/packages/parchment_to_html) to parse document to HTML, then [html2md](https://pub.dev/packages/html2md) to transform HTML to MD.                                                                       | ✅ Simple WYSIWYG editor. If you are starting development with a Flutter app and don't care about the storage format, this is a great option for you. ⚠️ BUT take a closer look at the analogues, you may need to expand the functionality during development (in addition, it is updated very rarely). Also Toolbar is HARDCODED, so you can't extend it. |

## Functions comparison

|                                        | [flutter_quill](https://pub.dev/packages/flutter_quill) | [fleather](https://pub.dev/packages/fleather) |
|----------------------------------------|---------------------------------------------------------|-----------------------------------------------|
| Bold                                   | ✅️                                                      | ✅️                                            |
| Underline                              | ✅️                                                      | ✅️                                            |
| Italic                                 | ✅️                                                      | ✅️                                            |
| Line Through                           | ✅️                                                      | ✅️                                            |
| Code Block                             | ✅️                                                      | ✅️                                            |
| Paragraph Alignment                    | ✅️                                                      | ✅️                                            |
| Font Color                             | ✅️                                                      | ✅️                                            |
| Font Background Color                  | ✅️                                                      | ✅️                                            |
| Font Style (Heading 1, Heading 2, ...) | ✅️                                                      | ✅️                                            |
| Ordered List                           | ✅️                                                      | ✅️                                            |
| Unordered List (Bulleted)              | ✅️                                                      | ✅️                                            |
| Checked List                           | ✅️                                                      | ✅️                                            |
| Quotes                                 | ✅️                                                      | ✅️                                            |
| Horizontal Row                         | ❌                                                       | ✅️                                            |
| Undo / Redo Buttons                    | ✅️                                                      | ✅️                                            |
| URL Inserting                          | ✅️                                                      | ✅️                                            |
| Search in Document                     | ✅️                                                      | ❌                                             |
| Font Family                            | ✅️                                                      | ❌                                             |
| Font Size                              | ✅️                                                      | ❌                                             |
| Subscript                              | ✅️                                                      | ❌                                             |
| Superscript                            | ✅️                                                      | ❌                                             |
| Indention                              | ✅️                                                      | ✅️                                            |
