import 'package:flutter/material.dart';
import 'package:tugas8_detail_and_receipt_order/core/app_color.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: AppColor.mainColor)),
        centerTitle: true,
      ),
      body: Center(child: Text('INI SETTING SCREEN')),
    );
  }
}
