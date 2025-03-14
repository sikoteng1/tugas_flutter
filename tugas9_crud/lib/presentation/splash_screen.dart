import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, '/login');
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset(
              'assets/logo/logo2_blue.png',
            ),
            SizedBox(height: 300),
            Column(
              children: [
                Text(
                  'from',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                SizedBox(height: 10
                ),
                Image.asset(
                  'assets/logo/logo1_from.png',
                  width: 70,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
