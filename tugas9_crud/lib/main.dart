import 'package:flutter/material.dart';
import 'package:tugas9_crud/presentation/detail_order.dart';
import 'package:tugas9_crud/presentation/history_screen.dart';
import 'package:tugas9_crud/presentation/login_screen.dart';
import 'package:tugas9_crud/presentation/main_screen.dart';
import 'package:tugas9_crud/presentation/settings_screen.dart';
import 'package:tugas9_crud/presentation/splash_screen.dart';
import 'package:tugas9_crud/presentation/ticket_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'inter'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/main': (context) => MainScreen(),
        '/ticket': (context) => TicketScreen(),
        '/history': (context) => HistoryScreen(),
        '/settings': (context) => SettingsScreen(),
        '/detail': (context) => DetailOrderScreen(),
      },
    );
  }
}
