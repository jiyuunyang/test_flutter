// widgetbook.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the generated directories variable
import 'widgetbook.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

// The @App annotation generates a file containing
// a single variable called directories.
@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
        // Use the generated directories variable
        directories: directories,
        addons: [
          MaterialThemeAddon(themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData(
                colorScheme: const ColorScheme.light(
                  primary: Colors.white,
                ),
              ),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData(
                colorScheme: const ColorScheme.dark(
                  primary: Colors.white,
                ),
              ),
            ),
          ]),
          TextScaleAddon(scales: [1.0, 2.0]),
          LocalizationAddon(locales: [
            const Locale('en', 'US'),
          ], localizationsDelegates: [
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ]),
          DeviceFrameAddon(devices: [
            Devices.ios.iPad,
            Devices.android.smallTablet,
            Devices.windows.laptop,
          ]),
          GridAddon(100),
          AlignmentAddon()
        ],
      appBuilder: (context, child) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: child,
            );
          },
          child: child,
        );
      },
    );
  }
}
