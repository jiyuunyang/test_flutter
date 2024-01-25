import 'package:flutter/material.dart';
import 'package:test_flutter/widgets/text_widget.dart';

/// Reference: https://arong.info/List/ContentsView/2395
class LayoutBuilderScreen extends StatelessWidget {
  const LayoutBuilderScreen({super.key});

  final _maxWidth = 1280;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Method',
      // You can use the library anywhere in the app even in theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < _maxWidth) {
            return const TextWidget();
          }
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Upper 1280 width size", textScaleFactor: 2)
            ],
          );
        }),
      )
    );
  }
}
