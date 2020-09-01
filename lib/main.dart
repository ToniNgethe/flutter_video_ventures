import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_ventures_flluter/constants.dart';
import 'package:video_ventures_flluter/routes.dart';
import 'package:video_ventures_flluter/screens/countries/countries_screen.dart';
import 'package:video_ventures_flluter/themes.dart';

import 'bloc/countries_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  CountriesBloc get _countriesBloc => CountriesBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CountriesBloc>(
            create: (context) {
              return _countriesBloc;
            },
          )
        ],
        child: MaterialApp(
          title: 'Video ventures',
          theme: themeData(),
          initialRoute: CountriesScreen.routeName,
          routes: routes,
        ));
  }
}