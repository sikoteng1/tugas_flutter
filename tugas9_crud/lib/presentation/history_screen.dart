import 'package:flutter/material.dart';
import 'package:tugas9_crud/core/app_color.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History', style: TextStyle(color: AppColor.mainColor)),
        centerTitle: true,
      ),
      body: Center(child: Text('INI HISTORY SCREEN')),
    );
  }
}
