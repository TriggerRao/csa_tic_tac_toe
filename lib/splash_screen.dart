import 'dart:async';
import 'package:flutter/material.dart';
import 'text_field.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const NameInputPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF141d2f),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Image.asset(
                'lib/Images/tic-tac-toe.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Tic Tac Toe',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'by Tarun Rao',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}