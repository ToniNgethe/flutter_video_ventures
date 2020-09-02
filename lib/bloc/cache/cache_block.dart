import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:objectdb/objectdb.dart';
import 'package:video_ventures_flluter/bloc/cache/cache_events.dart';
import 'package:video_ventures_flluter/bloc/cache/cache_state.dart';
import 'package:path_provider/path_provider.dart';

ObjectDB db;

class CacheBloc extends Bloc<CacheEvent, CacheState> {
  // get document directory using path_provider plugin
  String countriesDBfilePath;

  @override
  CacheState get initialState => CacheInitialState();

  @override
  Stream<CacheState> mapEventToState(CacheEvent event) async* {
    if (event is CacheAddCountryEvent) {
      yield* _mapEventAddCountry(event);
    }
  }

  _initCountriesDb() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    countriesDBfilePath = [appDocDir.path, 'countries.db'].join('/');
  }

  Stream<CacheState> _mapEventAddCountry(CacheAddCountryEvent event) async* {
    print("Country to be added : --> ${event.data.name}");

    _initCountriesDb();
    ObjectDB countriesDB = ObjectDB(countriesDBfilePath);
    countriesDB.open();

    final list =  await countriesDB.find(Map<dynamic, dynamic>());
    print("list sixe ===> " + list.length.toString());
    if(list.length >= 3){
        yield CacheBlocError(message : "You have already selected 3 countries");
    }else {
      // check if it exists
      countriesDB.insert(event.data.toJson());
      yield CacheCountryAdded();
    }
  }
}
