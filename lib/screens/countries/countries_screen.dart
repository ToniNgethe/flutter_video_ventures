import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_ventures_flluter/bloc/cache/cache_block.dart';
import 'package:video_ventures_flluter/bloc/cache/cache_state.dart';
import 'package:video_ventures_flluter/bloc/countries/countries_bloc.dart';
import 'package:video_ventures_flluter/bloc/countries/countries_event.dart';
import 'package:video_ventures_flluter/bloc/countries/countries_state.dart';
import 'package:video_ventures_flluter/components/error_widget.dart';
import 'package:video_ventures_flluter/components/loading_widget.dart';
import 'package:video_ventures_flluter/model/countries_model.dart';
import 'package:video_ventures_flluter/size.config.dart';

import 'components/countries_grid.dart';
import 'components/search_country_field.dart';

class CountriesScreen extends StatelessWidget {
  static String routeName = "/countries";
  Function onChange;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: CountriesBody(),
    );
  }
}

class CountriesBody extends StatefulWidget {
  @override
  _CountriesBodyState createState() => _CountriesBodyState();
}

class _CountriesBodyState extends State<CountriesBody> {
  String search;
  CountriesBloc _countriesBloc;
  CacheBloc _cacheBloc;
  List<Data> _dataList = [];

  @override
  void dispose() {
    _countriesBloc.close();
    _cacheBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    _countriesBloc = BlocProvider.of<CountriesBloc>(context);
    _cacheBloc = BlocProvider.of<CacheBloc>(context);

    _countriesBloc.add(FetchCountriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesBloc, CountriesState>(
        bloc: _countriesBloc,
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "Select three countries you want \nto check out first",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  SearchCountryField(onChange: onSearchTextChanged),
                  SizedBox(
                    height: 10,
                  ),
                  if (state is CountriesLoadingState)
                    LoadingWidget()
                  else if (state is CountriesErrorState)
                    ErrorView(
                      message: state.message,
                    )
                  else if (state is CountriesLoadedState)
                    _dataList.length == 0
                        ? CountriesGrid(
                            data: state.data,
                          )
                        : CountriesGrid(
                            data: _dataList,
                          ),
                  BlocBuilder<CacheBloc, CacheState>(
                    bloc: _cacheBloc,
                    builder: (_, cState) {
                      if (cState is CacheBlocError) {
                        Future.delayed(Duration.zero, () {
                          setState(() {
                            Flushbar(
                              // ignore: missing_return
                              message: cState.message,
                              backgroundColor: Colors.red,
                              isDismissible: true,
                              duration: Duration(seconds: 2),
                            )..show(context);
                          });
                        });
                      }
                      return SizedBox();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  ///  search countries from db
  onSearchTextChanged(String text) async {
    _dataList.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    if (_countriesBloc.state is CountriesLoadedState) {
      CountriesLoadedState cState = _countriesBloc.state;
      cState.data.forEach((element) {
        if (element.name.toLowerCase().contains(text.toLowerCase())) {
          _dataList.add(element);
        }
      });
    }
    setState(() {});
  }
}
