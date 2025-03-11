import 'package:flutter/material.dart';
import 'package:tugas8_detail_and_receipt_order/presentation/detail_order.dart';
import 'package:tugas8_detail_and_receipt_order/presentation/history_screen.dart';
import 'package:tugas8_detail_and_receipt_order/presentation/login_screen.dart';
import 'package:tugas8_detail_and_receipt_order/presentation/main_screen.dart';
import 'package:tugas8_detail_and_receipt_order/presentation/settings_screen.dart';
import 'package:tugas8_detail_and_receipt_order/presentation/splash_screen.dart';
import 'package:tugas8_detail_and_receipt_order/presentation/ticket_screen.dart';

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
