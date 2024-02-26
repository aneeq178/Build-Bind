
import 'package:buildbind/Utills/AppColors.dart';
import 'package:buildbind/View/Auth/login_screen.dart';
import 'package:buildbind/View/home/dashboard_screen.dart';
import 'package:buildbind/View/onbaording/obboarding_one.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
  Future.delayed(Duration(seconds: 2), () {
  // Navigate to the next screen
  Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) =>OnboardingOne()),
  );
  });
    return Scaffold(
      backgroundColor: APPCOLORS.PRIMARY ,
      body: Container(
        decoration: BoxDecoration(
          color: APPCOLORS.PRIMARY,
          image: DecorationImage(image: AssetImage('assets/images/Splashs.jpg'),),
        ),
      ),
    );
  }
}
