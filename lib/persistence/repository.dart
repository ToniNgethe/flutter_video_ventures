import 'package:video_ventures_flluter/model/countries_model.dart';
import 'package:video_ventures_flluter/persistence/api_provider.dart';

class Repository {
  ApiProvider apiProvider = ApiProvider();

  Future<CountriesModel> fetchCountries() => apiProvider.fetchCountries();
}
