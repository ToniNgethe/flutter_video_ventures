import 'package:flutter/material.dart';
import 'package:video_ventures_flluter/model/countries_model.dart';
import 'package:video_ventures_flluter/screens/countries/components/country_item.dart';

class CountriesGrid extends StatelessWidget {
  final List<Data> data;

  const CountriesGrid({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 100 / 50,
      children: List.generate(
          data.length, (index) =>  CountryItem(countryModel: data[index])),
    ));
  }
}
