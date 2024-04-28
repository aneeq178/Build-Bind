import 'package:buildbind/Controllers/listing_controllers.dart';
import 'package:buildbind/Providers/Text_Recognition_Provider.dart';
import 'package:buildbind/Providers/cost_estimation_prvider.dart';
import 'package:buildbind/Utills/AppColors.dart';
import 'package:buildbind/View/bottom_nav_bar.dart';
import 'package:buildbind/View/home/dashboard_screen.dart';
import 'package:buildbind/View/onbaording/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
      MultiProvider(  providers: [
        ChangeNotifierProvider(create: (_) => CostEstimationProvider()),
        ChangeNotifierProvider(create: (_) => ListingController()),
        ChangeNotifierProvider(create: (_) => TextRecognitionController()),
      ],
          child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final MaterialColor myCustomColor = const MaterialColor(
    0xFF234F68,
    <int, Color>{
      50: Color(0xFFE3EBF0),
      100: Color(0xFFB3C8D6),
      200: Color(0xFF82A5BC),
      300: Color(0xFF5272A1),
      400: Color(0xFF314F87),
      500: Color(0xFF234F68), // Your custom color
      600: Color(0xFF1A455D),
      700: Color(0xFF112C51),
      800: Color(0xFF0A2246),
      900: Color(0xFF01183B),
    },
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch:myCustomColor,
                  appBarTheme: AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: APPCOLORS.SECONDARY,
                      systemNavigationBarColor: APPCOLORS.SECONDARY,
                      statusBarIconBrightness: Brightness.light,
                      statusBarBrightness: Brightness.light,
                    ),
                  )),
              title: 'Flutter Demo',
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
    return BottomNavigation();
  }
}
