import 'package:flutter/material.dart';
import 'package:video_ventures_flluter/screens/intro_/intro_screen.dart';
import 'package:video_ventures_flluter/size.config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  _moveToNext(context){
    Future.delayed(const Duration(milliseconds: 2000), (){
      Navigator.pushNamed(context, IntroScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
   // _moveToNext(context);
    return Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          elevation: 0,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 150),
            child: Image.asset(
              "assets/images/logo.png",
              height: getProportionateScreenHeight(150),
              width: getProportionateScreenWidth(150),
            ),
          ),
        ));
  }
}
