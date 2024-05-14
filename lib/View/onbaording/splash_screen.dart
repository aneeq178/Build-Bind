
import 'package:buildbind/Services/api_calls.dart';
import 'package:buildbind/Utills/AppColors.dart';
import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:buildbind/View/Auth/login_screen.dart';
import 'package:buildbind/View/home/dashboard_screen.dart';
import 'package:buildbind/View/onbaording/obboarding_one.dart';
import 'package:flutter/material.dart';

import '../bottom_nav_bar.dart';
import '../bottom_nav_two.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  navigateto()
  {
    Future.delayed(Duration(seconds: 3), () async {



      String name=await ApiCall.getIds()??'';
      String is_contractor=await ApiCall.getUserType()??'';

      print('name is ${name}');
      print('name is ${is_contractor}');

      if(is_contractor=='')
      {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => OnboardingOne()));
      }
      else
      {
        if(is_contractor=='true')
        {
       context.navigateTo(BottomNavigation2());
        }
        else
          {
            context.navigateTo(BottomNavigation());

          }

      }

    });

  }

  @override
  void initState() {
    navigateto();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

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
