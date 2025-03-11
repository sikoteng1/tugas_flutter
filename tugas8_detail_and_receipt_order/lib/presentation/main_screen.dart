import 'package:flutter/material.dart';
import 'package:tugas8_detail_and_receipt_order/core/app_color.dart';
import 'package:tugas8_detail_and_receipt_order/presentation/history_screen.dart';
import 'package:tugas8_detail_and_receipt_order/presentation/home_screen.dart';
import 'package:tugas8_detail_and_receipt_order/presentation/settings_screen.dart';
import 'package:tugas8_detail_and_receipt_order/presentation/ticket_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int posisiSaatIni = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[posisiSaatIni],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColor.grey,
        selectedItemColor: AppColor.mainColor,
        currentIndex: posisiSaatIni,
        onTap: (index) {
          setState(() {
            posisiSaatIni = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket_outlined),
            label: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_sharp),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  List page = [HomeScreen(), TicketScreen(), HistoryScreen(), SettingsScreen()];
}
