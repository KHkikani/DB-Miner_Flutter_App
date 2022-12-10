
import 'package:animal_biography_app/Helpers/Database_Helper.dart';
import 'package:animal_biography_app/global/global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/animalPage.dart';
import 'pages/Homepage.dart';
import 'pages/Splash_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

   bool? initDB = prefs.getBool('initDB') ?? false;

   if(!initDB){
     Global.databaseCreate();
   }

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "splash",
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => const Homepage(),
        "splash":(context) => const SplashScreen(),
        "animalPage":(context) => const AnimalPage(),
      },
    );
  }
}


