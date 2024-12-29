/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habitopia/Pages/Homepage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const Homepage(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xFFCDC1FF), Color(0xFF7B7499)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Center(
          child: Image.asset(
            'assets/Habitopia.png',
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}
*/