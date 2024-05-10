import 'package:buildbind/Controllers/project_controler.dart';
import 'package:buildbind/Providers/listing_providers.dart';
import 'package:buildbind/Providers/Text_Recognition_Provider.dart';
import 'package:buildbind/Providers/cost_estimation_prvider.dart';
import 'package:buildbind/Utills/AppColors.dart';
import 'package:buildbind/View/bottom_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

void main() async{

  _checkFirebaseConnection();
  runApp(
      MultiProvider(  providers: [
        ChangeNotifierProvider(create: (_) => CostEstimationProvider()),
        ChangeNotifierProvider(create: (_) => ListingController()),
        ChangeNotifierProvider(create: (_) => TextRecognitionController()),
        ChangeNotifierProvider(create: (_) => ProjectController()),
      ],
          child:  MyApp()));
}

Future<void> _checkFirebaseConnection() async {
  print('I am here');

  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    
    print('firebase connected');

  } catch (e) {
    print('firebase not connected');

  }
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
