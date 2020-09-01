import 'package:flutter/material.dart';
import 'package:video_ventures_flluter/screens/countries/countries_screen.dart';

import '../../../constants.dart';
import '../../../size.config.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: getProportionateScreenHeight(50),
        decoration: BoxDecoration(
          color: kAccentColor,
        ),
        child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, CountriesScreen.routeName);
          },
          textColor: Colors.white,

          child: Text("Continue"),
        ),
      ),
    );
  }
}

