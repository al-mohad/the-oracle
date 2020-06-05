import 'package:flutter/material.dart';
import 'package:oracle/models/settings_model.dart';
import 'package:oracle/screens/home_screen.dart';
import 'package:oracle/utils/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(darkTheme),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme(),
      home: HomeScreen(),
    );
  }
}
