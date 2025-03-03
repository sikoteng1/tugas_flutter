import 'package:flutter/material.dart';
import 'package:tugas5_splash_screen_quick_tix/screen/login_page.dart';
import 'package:tugas5_splash_screen_quick_tix/screen/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),

      },
    );
  }
}
