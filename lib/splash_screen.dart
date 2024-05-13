import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    startTimer();
  }

  startTimer(){
    var duration = const Duration(seconds: 6);
    return Timer(duration, route);
  }

  route(){
    Navigator.pushReplacementNamed(context, '/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: content()),
    );
  }

  Widget content(){
    return Container(
        child : Lottie.network("https://lottie.host/9195743d-788d-46ca-8c4a-b13be7734d7f/n2EuT3SxgU.json")
    );

  }
}
