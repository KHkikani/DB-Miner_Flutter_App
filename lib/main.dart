
import 'package:flutter/material.dart';
import 'package:life_quotes/global/global.dart';
import 'package:life_quotes/screens/categoriesPage.dart';
import 'package:life_quotes/screens/detailsPage.dart';
import 'package:life_quotes/screens/homePage.dart';
import 'package:life_quotes/screens/quotesPage.dart';
import 'package:life_quotes/screens/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

   bool hasInitDB = prefs.getBool('hasInitDB') ?? false;
  if(hasInitDB){
    Global.homePageState = true;
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:(hasInitDB) ? "HomePage" : "splashScreen",
      routes: {
        "HomePage" : (context)=>HomePage(),
        "splashScreen" : (context)=>SplashScreen(),
        "categoriesPage" : (context)=>CategoriesPage(),
        "quotesPage" : (context)=>QuotesPage(),
        "detailsPage" : (context)=>DetailsPage(),
      },
    ),
  );
}
