class CountriesModel {
  bool _status;
  String _message;
  List<Data> _data;

  bool get status => _status;
  String get message => _message;
  List<Data> get data => _data;

  CountriesModel({
      bool status, 
      String message, 
      List<Data> data}){
    _status = status;
    _message = message;
    _data = data;
}

  CountriesModel.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  String _id;
  String _name;
  String _capital;
  String _flag;
  String _region;
  String _subregion;
  List<Currencies> _currencies;
  List<Languages> _languages;
  String _coverPhoto;

  String get id => _id;
  String get name => _name;
  String get capital => _capital;
  String get flag => _flag;
  String get region => _region;
  String get subregion => _subregion;
  List<Currencies> get currencies => _currencies;
  List<Languages> get languages => _languages;
  String get coverPhoto => _coverPhoto;

  Data({
      String id, 
      String name, 
      String capital, 
      String flag, 
      String region, 
      String subregion, 
      List<Currencies> currencies, 
      List<Languages> languages, 
      String coverPhoto}){
    _id = id;
    _name = name;
    _capital = capital;
    _flag = flag;
    _region = region;
    _subregion = subregion;
    _currencies = currencies;
    _languages = languages;
    _coverPhoto = coverPhoto;
}

  Data.fromJson(dynamic json) {
    _id = json["Id"];
    _name = json["name"];
    _capital = json["capital"];
    _flag = json["flag"];
    _region = json["region"];
    _subregion = json["subregion"];
    if (json["currencies"] != null) {
      _currencies = [];
      json["currencies"].forEach((v) {
        _currencies.add(Currencies.fromJson(v));
      });
    }
    if (json["languages"] != null) {
      _languages = [];
      json["languages"].forEach((v) {
        _languages.add(Languages.fromJson(v));
      });
    }
    _coverPhoto = json["coverPhoto"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["name"] = _name;
    map["capital"] = _capital;
    map["flag"] = _flag;
    map["region"] = _region;
    map["subregion"] = _subregion;
    if (_currencies != null) {
      map["currencies"] = _currencies.map((v) => v.toJson()).toList();
    }
    if (_languages != null) {
      map["languages"] = _languages.map((v) => v.toJson()).toList();
    }
    map["coverPhoto"] = _coverPhoto;
    return map;
  }

}

class Languages {
  String _name;
  String _native;

  String get name => _name;
  String get native => _native;

  Languages({
      String name, 
      String native}){
    _name = name;
    _native = native;
}

  Languages.fromJson(dynamic json) {
    _name = json["name"];
    _native = json["native"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["native"] = _native;
    return map;
  }

}

class Currencies {
  String _code;
  String _name;
  String _symbol;

  String get code => _code;
  String get name => _name;
  String get symbol => _symbol;

  Currencies({
      String code, 
      String name, 
      String symbol}){
    _code = code;
    _name = name;
    _symbol = symbol;
}

  Currencies.fromJson(dynamic json) {
    _code = json["code"];
    _name = json["name"];
    _symbol = json["symbol"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["name"] = _name;
    map["symbol"] = _symbol;
    return map;
  }

}