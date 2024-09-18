// ignore_for_file: prefer_const_constructors

import 'package:dark_and_light_mode_app/home_page.dart';
import 'package:dark_and_light_mode_app/theme/app_theme.dart';
import 'package:dark_and_light_mode_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider()..init(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, ThemeProvider notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: notifier.isDarkMode? ThemeMode.dark : ThemeMode.light,
          darkTheme: notifier.isDarkMode ? darkMode : lightMode,
          theme: Provider.of<ThemeProvider>(context).themeData,
          home: HomePage(),
        );
      }
    );
  }
}

