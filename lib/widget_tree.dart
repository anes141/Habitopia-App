import 'package:flutter/material.dart';
import 'package:habit_tracker/auth.dart';
import 'package:habit_tracker/screens/main_screen.dart';
import 'screens/login_signup.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MainScreen();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
