// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dark_and_light_mode_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Consumer<ThemeProvider>(
        builder: (context, ThemeProvider notifier , child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  notifier.isDarkMode ? 'assets/dark_mode.png' : 'assets/light_mode.png',
                  height: 200,
                  width: 200,
                ),
                SizedBox(height: 40,),
                Text(
                  notifier.isDarkMode ? "Dark Mode" : "Light Mode",
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).colorScheme.secondary
                  ),
                ),
                SizedBox(height: 80,),
                Transform.scale(
                  scale: 1.75,
                  child: Switch(
                    value: notifier.isDarkMode, 
                    onChanged: (vlaue){
                      notifier.toggleTheme();
                    },
                    activeColor: Color(0xffffffff),
                    activeTrackColor: Color(0xff3B95FF),
                    inactiveTrackColor: Color(0xffC4C4C4),
                    inactiveThumbColor: Color(0xffffffff),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}