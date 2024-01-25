import 'package:flutter/material.dart';
import 'package:test_flutter/utils/font_size_resolver.dart';
import 'package:test_flutter/widgets/text_widget.dart';

/// Reference : https://api.flutter.dev/flutter/widgets/MediaQuery-class.html
class MediaQueryScreen extends StatelessWidget {
  const MediaQueryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Media Query Screen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('displaySize : ${MediaQuery.of(context).size}', textScaleFactor: ScaleSize.textScaleFactor(context),),
              Text('displayHeight : ${MediaQuery.of(context).size.height}', textScaleFactor: ScaleSize.textScaleFactor(context),),
              Text('displayWidth : ${MediaQuery.of(context).size.width}', textScaleFactor: ScaleSize.textScaleFactor(context),),
              Text('devicePixelRatio : ${MediaQuery.of(context).devicePixelRatio}', textScaleFactor: ScaleSize.textScaleFactor(context),),
              Text('statusBarHeight : ${MediaQuery.of(context).padding.top}', textScaleFactor: ScaleSize.textScaleFactor(context),),
              const SizedBox(height: 30),
              const TextWidget()
            ],
          ),
        ),
      ),
    );
  }
}
