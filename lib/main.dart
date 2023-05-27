import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:theme_switch_app/screen/home.dart';

Future<void> main() async {
  await Hive.initFlutter();

  await Hive.openBox('settings');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('settings').listenable(),
      builder: (context, box, child) {
        final isDark = box.get('isDark', defaultValue: false);
        return MaterialApp(
          theme: isDark ? ThemeData.dark() : ThemeData(),
          home: const HomePage(),
        );
      },
    );
  }
}
