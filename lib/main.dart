import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_ventures_flluter/bloc/cache/cache_block.dart';
import 'package:video_ventures_flluter/routes.dart';
import 'package:video_ventures_flluter/screens/splash_screen.dart';
import 'package:video_ventures_flluter/themes.dart';

import 'bloc/countries/countries_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  CountriesBloc get _countriesBloc => CountriesBloc();

  CacheBloc get _cacheBloc => CacheBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CountriesBloc>(
            create: (context) {
              return _countriesBloc;
            },
          ),
          BlocProvider<CacheBloc>(
            create: (context) {
              return _cacheBloc;
            },
          )
        ],
        child: MaterialApp(
          title: 'Video ventures',
          theme: themeData(),
          initialRoute: SplashScreen.routeName,
          routes: routes,
        ));
  }
}
