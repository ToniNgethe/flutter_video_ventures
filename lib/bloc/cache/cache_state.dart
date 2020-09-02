import 'package:equatable/equatable.dart';
import 'package:video_ventures_flluter/model/countries_model.dart';

abstract class CacheState extends Equatable {}

class CacheInitialState extends CacheState {
  @override
  List<Object> get props => [];
}

class CacheCountryAdded extends CacheState {
  Data country;

  CacheCountryAdded({this.country});

  @override
  List<Object> get props => [country];
}

class CacheBlocError extends CacheState {
  String message;

  CacheBlocError({this.message});

  @override
  List<Object> get props => [message];
}
