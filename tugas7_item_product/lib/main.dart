import 'package:flutter/material.dart';
import 'package:tugas7_item_product/presentation/history_screen.dart';
import 'package:tugas7_item_product/presentation/login_screen.dart';
import 'package:tugas7_item_product/presentation/main_screen.dart';
import 'package:tugas7_item_product/presentation/settings_screen.dart';
import 'package:tugas7_item_product/presentation/splash_screen.dart';
import 'package:tugas7_item_product/presentation/ticket_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'inter'
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/main': (context) => MainScreen(),
        '/ticket': (context) => TicketScreen(),
        '/history': (context) => HistoryScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
