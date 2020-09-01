import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text("Video collections of the most beautiful places,\nexperiences  and unusual housings in \nthe world for newbies as well as \nprofessional travellers.",
        style: TextStyle(
            fontSize: 16,
            color: Colors.white
        ),
      ),
    );
  }
}

