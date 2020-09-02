import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size.config.dart';

class SearchCountryField extends StatelessWidget {
  const SearchCountryField({
    Key key,
    this.onChange,
  }) : super(key: key);
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kPrimaryLightColor),
      width: double.infinity,
      height: getProportionateScreenHeight(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: Icon(
              Icons.search,
              color: kTextColor,
              size: 25,
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(5),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Container(
              height: double.infinity,
              width: 1,
              decoration: BoxDecoration(color: kTextColor),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(5),
          ),
          Expanded(
            child: _buildSearchTextFormField(onChange),
          )
        ],
      ),
    );
  }

  TextFormField _buildSearchTextFormField(onChange) {
    return TextFormField(
      onChanged: onChange,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
          hintText: "Search country",
          hintStyle: TextStyle(color: kTextColor),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 10, bottom: 0, top: 0, right: 0)),
    );
  }
}
