import 'package:flutter/material.dart';
import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_guideline_01/01_app_icon_splashScreen/after_splashScreenPage.dart';
// flutter pub add animated_text_kit
// flutter pub add flutter_launcher_icons

class HomeScreen01 extends StatefulWidget {
  const HomeScreen01({super.key});

  @override
  State<HomeScreen01> createState() => _HomeScreen01State();
}

class _HomeScreen01State extends State<HomeScreen01> {
     Color plumColor = Color(0xff701B71);
     Color accentPinkColor = Color(0xffFDE1EF);
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AfterSplashScreenPage()));
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: accentPinkColor,
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/notes.png")),
              )),
          AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
            TyperAnimatedText(
              'This Is A splash screen',
              speed: const Duration(milliseconds: 100),
              textStyle: const TextStyle(
                color: Color(0xff701B71),
                fontFamily: "Valid_Harmony",
                fontSize: 30,
              ),
            ),
          ])
        ],
      ),
    );
  }
}