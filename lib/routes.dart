
import 'package:flutter/material.dart';
import 'package:video_ventures_flluter/screens/countries/countries_screen.dart';
import 'package:video_ventures_flluter/screens/intro_/intro_screen.dart';
import 'package:video_ventures_flluter/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName : (context) => SplashScreen(),
  IntroScreen.routeName: (context) => IntroScreen(),
  CountriesScreen.routeName: (context) => CountriesScreen()
};