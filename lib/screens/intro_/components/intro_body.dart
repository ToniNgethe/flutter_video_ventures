import 'package:flutter/material.dart';
import 'package:video_ventures_flluter/screens/intro_/components/sub_title_text.dart';
import 'package:video_ventures_flluter/screens/intro_/components/title_text.dart';
import 'package:video_ventures_flluter/size.config.dart';

import 'continue_button.dart';

class IntroBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TitleText(),
          SizedBox(height: getProportionateScreenHeight(16),),
          SubTitleText(),
          ContinueButton()
        ],
      ),
    );
  }
}

