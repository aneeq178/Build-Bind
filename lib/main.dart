import 'package:buildbind/Utills/AppColors.dart';
import 'package:buildbind/View/home/dashboard_screen.dart';
import 'package:buildbind/View/onbaording/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const MyHomePage(),
            );
          }
      );
  }
}
final ThemeData myTheme = ThemeData(
  // primarySwatch:MaterialColor(APPCOLORS.PRIMARY),
);

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
