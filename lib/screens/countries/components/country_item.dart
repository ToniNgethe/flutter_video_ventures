import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_ventures_flluter/bloc/cache/cache_block.dart';
import 'package:video_ventures_flluter/bloc/cache/cache_events.dart';
import 'package:video_ventures_flluter/bloc/cache/cache_state.dart';
import 'package:video_ventures_flluter/model/countries_model.dart';

import '../../../constants.dart';

class CountryItem extends StatelessWidget {
  const CountryItem({
    Key key,
    this.countryModel,
  }) : super(key: key);
  final Data countryModel;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    return GestureDetector(
      onTap: () {
        // ignore: close_sinks
        CacheBloc _cacheBloc = BlocProvider.of<CacheBloc>(context);
        _cacheBloc.add(CacheAddCountryEvent(countryModel));
      },
      child: Container(
        decoration: BoxDecoration(color: kPrimaryLightColor),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  SvgPicture.network(
                    countryModel.flag,
                    height: 20,
                    width: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "${countryModel.name}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "${_getLanguages(countryModel.languages)}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getLanguages(List<Languages> list) {
    String language = "";
    if (list.length == 1) {
      language = list[0].name;
    } else {
      list.forEach((element) {
        if (language == "") {
          language = element.name;
        } else {
          language = language + "," + element.name;
        }
      });
    }
    return language;
  }
}
