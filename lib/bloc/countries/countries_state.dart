import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_ventures_flluter/model/countries_model.dart';

abstract class CountriesState extends Equatable {}

class CountriesInitialState extends CountriesState {
  @override
  List<Object> get props => [];
}

class CountriesLoadingState extends CountriesState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CountriesLoadedState extends CountriesState {
  List<Data> data;

  CountriesLoadedState({@required this.data});

  @override
  List<Object> get props => [data];
}

class CountriesErrorState extends CountriesState {
  String message;

  CountriesErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
