import 'package:flutter/material.dart';
import 'package:video_player_app/screen/view/Home_screen.dart';


void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:
      {
        '/':(context)=> Video_player(),
      },
    );
  }
}

