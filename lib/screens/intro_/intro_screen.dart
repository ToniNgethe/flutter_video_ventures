import 'package:flutter/material.dart';
import 'package:video_ventures_flluter/screens/intro_/components/intro_body.dart';

class IntroScreen extends StatelessWidget {
  static String routeName = "/intro";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroBody(),
    );
  }
}
