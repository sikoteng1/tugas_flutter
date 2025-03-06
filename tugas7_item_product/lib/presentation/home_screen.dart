import 'package:flutter/material.dart';
import 'package:tugas7_item_product/core/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello user', style: TextStyle(color:AppColor.mainColor)),
        centerTitle: true,
      ),
      body: Center(
        child: Text('INI HOME SCREEN\n btw tugasnya ada di Ticket screen bang\n di tombol kedua'),
      ),
    );
  }
}