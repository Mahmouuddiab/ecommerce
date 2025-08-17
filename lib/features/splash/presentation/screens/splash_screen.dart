import 'package:ecommerce/core/router/app_routes.dart';
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
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset("assets/Splash Screen.png"),
    );
  }
}
