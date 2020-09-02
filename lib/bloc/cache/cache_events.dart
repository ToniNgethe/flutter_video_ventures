import 'package:equatable/equatable.dart';
import 'package:video_ventures_flluter/model/countries_model.dart';

abstract class CacheEvent extends Equatable{}

class CacheInitEvent extends CacheEvent{
  @override
  List<Object> get props => [];
}

class CacheAddCountryEvent extends CacheEvent{
  final Data data;

  CacheAddCountryEvent(this.data);

  @override
  List<Object> get props => [data];
}