import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_ventures_flluter/bloc/countries_bloc.dart';
import 'package:video_ventures_flluter/bloc/countries_event.dart';
import 'package:video_ventures_flluter/bloc/countries_state.dart';
import 'package:video_ventures_flluter/constants.dart';
import 'package:video_ventures_flluter/model/countries_model.dart';
import 'package:video_ventures_flluter/size.config.dart';

class CountriesScreen extends StatelessWidget {
  static String routeName = "/countries";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
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
              SearchCountryField(),
              SizedBox(
                height: 10,
              ),
              CountriesContainer()
            ],
          ),
        ),
      ),
    );
  }
}

class CountriesContainer extends StatefulWidget {
  @override
  _CountriesContainerState createState() => _CountriesContainerState();
}

class _CountriesContainerState extends State<CountriesContainer> {
  bool display = true;
  CountriesBloc countriesBloc;

  @override
  Widget build(BuildContext context) {
    countriesBloc = BlocProvider.of<CountriesBloc>(context);
    countriesBloc.add(FetchCountriesEvent());

    return BlocBuilder<CountriesBloc, CountriesState>(
      bloc: countriesBloc,
      builder: (context, state) {
        print("state---?" + state.toString());
        if (state is CountriesLoadingState) {
          return LoadingWidget();
        } else if (state is CountriesErrorState) {
          // ignore: missing_return
          return ErrorWidget(
            message: state.message,
          );
        } else {
          if (state is CountriesLoadedState) {
            return Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 100 / 50,
              children: List.generate(state.data.length,
                  (index) => CountryItem(countryModel: state.data[index])),
            ));
          }
          return null;
        }
      },
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/logo_no_text.png",
              height: 30,
              width: 30,
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    Key key,
    this.message,
  }) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          message,
          style: TextStyle(fontSize: 14, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CountryItem extends StatelessWidget {
  const CountryItem({
    Key key,
    this.countryModel,
  }) : super(key: key);
  final Data countryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kPrimaryLightColor),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                SvgPicture.network(
                 countryModel.flag,
                  height: 20,
                  width: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "${countryModel.name}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "${_getLanguages(countryModel.languages)}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String _getLanguages(List<Languages> list) {
    String language = "";
    if (list.length == 1) {
      language = list[0].name;
    } else {
      list.forEach((element) {
        if (language == "") {
          language = element.name;
        } else {
          language = language + "," + element.name;
        }
      });
    }
    return language;
  }
}

class SearchCountryField extends StatelessWidget {
  const SearchCountryField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kPrimaryLightColor),
      width: double.infinity,
      height: getProportionateScreenHeight(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: Icon(
              Icons.search,
              color: kTextColor,
              size: 25,
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(5),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Container(
              height: double.infinity,
              width: 1,
              decoration: BoxDecoration(color: kTextColor),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(5),
          ),
          Expanded(
            child: _buildSearchTextFormField(),
          )
        ],
      ),
    );
  }

  TextFormField _buildSearchTextFormField() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
          hintText: "Search country",
          hintStyle: TextStyle(color: kTextColor),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 10, bottom: 0, top: 0, right: 0)),
    );
  }
}
