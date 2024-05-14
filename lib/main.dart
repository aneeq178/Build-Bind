import 'package:buildbind/Controllers/bid_controller.dart';
import 'package:buildbind/Controllers/contractor_controller.dart';
import 'package:buildbind/Controllers/local_storage_controller.dart';
import 'package:buildbind/Controllers/project_controler.dart';
import 'package:buildbind/Controllers/user_local_conrtoller.dart';
import 'package:buildbind/Providers/listing_providers.dart';
import 'package:buildbind/Providers/Text_Recognition_Provider.dart';
import 'package:buildbind/Providers/cost_estimation_prvider.dart';
import 'package:buildbind/Providers/project_filtter_provider.dart';
import 'package:buildbind/Services/chat_service.dart';
import 'package:buildbind/Utills/AppColors.dart';
import 'package:location/location.dart';
import 'package:buildbind/View/onbaording/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'Controllers/chat_controller.dart';
import 'Providers/contractor_fillter_provider.dart';
import 'View/bottom_nav_two.dart';
import 'firebase_options.dart';

void main() async{

  _checkFirebaseConnection();
  runApp(
      MultiProvider(  providers: [
        ChangeNotifierProvider(create: (_) => CostEstimationProvider()),
        ChangeNotifierProvider(create: (_) => ListingController()),
        ChangeNotifierProvider(create: (_) => TextRecognitionController()),
        ChangeNotifierProvider(create: (_) => ProjectController()),
        ChangeNotifierProvider(create: (_) => ChatService()),
        ChangeNotifierProvider(create: (_) => ProjectController()),
        ChangeNotifierProvider(create: (_) => PFilterProvider()),
        ChangeNotifierProvider(create: (_) => CFilterProvider()),
        ChangeNotifierProvider(create: (_) => BidController()),
        ChangeNotifierProvider(create: (_) => ContractorController()),
        ChangeNotifierProvider(create: (_) => UserLocalController()),
        ChangeNotifierProvider(create: (_) => FavController()),
        ChangeNotifierProvider(create: (_) => ChatController()),
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

void _requestLocationPermission() async {
  print('in permission');
  final status = await location.requestPermission();
  if (status == PermissionStatus.granted) {
    print('in permission granted');


  }
}
Location location = Location();

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    _requestLocationPermission();
    return SplashScreen();
  }
}
