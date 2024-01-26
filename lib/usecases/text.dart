import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'text',
  type: Text,
)
Widget textUseCase(BuildContext context) {
  return const Column(
    children: [
      Text('Text Widget'),
    ],
  );
}
