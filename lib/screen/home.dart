import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switch'),
      ),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: Hive.box('settings').listenable(),
            builder: (context, box, child) {
              final isDark = box.get('isDark', defaultValue: false);
              return Switch(
                value: isDark,
                onChanged: (val) {
                  box.put('isDark', val);
                },
              );
            }),
      ),
    );
  }
}
