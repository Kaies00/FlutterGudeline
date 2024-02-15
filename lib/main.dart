import 'package:flutter/material.dart';
import 'package:flutter_guideline_01/01_app_icon_splashScreen/home_screen_01.dart';
import 'package:flutter_guideline_01/02_Bottom_Nav_Bar/home_screen_02.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
  SystemUiOverlay.bottom
]);  // to only hide the status bar
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,   
      ),
      home:  HomePage02(),
    );
  }
}
