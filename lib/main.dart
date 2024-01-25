import 'package:flutter/material.dart';
import 'package:test_flutter/screens/layout_builder_screen.dart';
import 'package:test_flutter/screens/media_query_screen.dart';
import 'package:test_flutter/screens/screen_util_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SCREEN TEST
    return const LayoutBuilderScreen();
    // return const MediaQueryScreen();
    // return const ScreenUtilScreen();
  }
}