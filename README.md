# Flutter WYSIWYG Editor Comparison

This repository is a project written in Flutter 3.29.1 that compares various Markdown and HTML editors. The main goal is to evaluate and display different editors within a Flutter application, providing the ability to switch between them using tabs.

## Editors Included:
- flutter_quill

## Comparison Result

| Library       | Easy-to-use                                                                                                                                                          | Editor                                                                                                                                                         |
|---------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| flutter_quill | ❌ Uses it's own format for storing data - Delta, so you need to adapt your code on other platforms for it (or translate from Delta to html/md, which brings loses). | ✅ A feature-rich WYSIWYG editor. If you are starting development with a Flutter app and don't care about the storage format, this is a great option for you.  |
