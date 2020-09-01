import 'package:equatable/equatable.dart';

abstract class CountriesEvent extends Equatable{}

class FetchCountriesEvent extends CountriesEvent {
  @override
  List<Object> get props => [];

}