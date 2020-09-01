import 'package:video_ventures_flluter/bloc/countries_event.dart';
import 'package:video_ventures_flluter/bloc/countries_state.dart';
import 'package:bloc/bloc.dart';
import 'package:video_ventures_flluter/model/countries_model.dart';
import 'package:video_ventures_flluter/persistence/repository.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState>{

  Repository repository = Repository();

  @override
  CountriesState get initialState => CountriesInitialState();

  @override
  Stream<CountriesState> mapEventToState(CountriesEvent event) async* {
    print(event.toString());
    if(event is FetchCountriesEvent){
      yield CountriesLoadingState();
      try{
        CountriesModel countriesModel = await repository.fetchCountries();
        if (countriesModel == null)
          yield CountriesErrorState(message: "Unable to fetch countries at the moment");
        if (countriesModel.status){
          yield CountriesLoadedState(data: countriesModel.data);
        }else{
          yield CountriesErrorState(message: countriesModel.message);
        }
      }catch(e){
        yield CountriesErrorState(message: e.toString());
      }
    }
  }

}