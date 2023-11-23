import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:season/src/app/data/models/countries_model.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/localization/ys_localizations_provider.dart';
import 'package:season/src/app/provider/app_provider.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/date_picker.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/button.dart';
import 'package:season/src/view/widgets/main_textfield.dart';
import 'package:season/src/view/widgets/select_input.dart';
import 'package:season/src/view/home/pages/passengers_page.dart';
import 'package:season/src/view/home/pages/room_page.dart';
import 'package:season/src/view/widgets/text.dart';

class TourismPage extends StatefulWidget {
  const TourismPage({super.key});
  @override
  State<TourismPage> createState() => _TourismPageState();
}

class _TourismPageState extends State<TourismPage> {
  String? startDate;
  int? adultsNum;
  int? childrenNum;
  int? infantsNum;
  int index = 0;
  CountriesModel? selectedCountry;
  CitiesModel? selectedCity;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      Provider.of<AppProvider>(context, listen: false).countries();
    });
  }

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);
    final isAr =
        Provider.of<YsLocalizationsProvider>(context).languageCode == 'ar';
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            backgroundColor: defultblue,
            title: Text("Tourism".trans),
            bottom: TabBar(
              indicatorColor: yellow,
              isScrollable: true,
              indicatorWeight: 3,
              onTap: (value) {
                index = value;
                print(value);
                setState(() {});
              },
              tabs: [
                TableCell(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 7, right: 20, left: 20),
                    child: CustomText(
                      text: "INCLUDE_FLIGHT".trans,
                      size: 14,
                      color: white,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 7, right: 20, left: 20),
                    child: CustomText(
                      text: "NOT_INCLUDE_FLIGHT".trans,
                      size: 14,
                      color: white,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(children: [
                  Builder(builder: (context) {
                    List<String>? countries = app.countriesModel
                        ?.map((e) => (isAr ? e.name : e.nameEn) ?? '')
                        .toList();
                    return SelectInput(
                      hint: 'country'.trans,
                      icon: Icon(
                        Icons.flag_outlined,
                        color: grey,
                      ),
                      items: countries ?? [],
                      currentValue: (isAr
                          ? selectedCountry?.name
                          : selectedCountry?.nameEn),
                      onChanged: (value) {
                        selectedCountry = app.countriesModel?.firstWhere(
                            (e) => (isAr ? e.name : e.nameEn) == value);
                        setState(() {});
                      },
                    );
                  }),
                  Builder(builder: (context) {
                    List<String>? cities = app
                        .citiesList(selectedCountry?.id)
                        ?.map((e) => (isAr ? e.name : e.nameEn) ?? '')
                        .toList();
                    return SelectInput(
                      hint: 'city'.trans,
                      icon: Icon(
                        Icons.location_city_outlined,
                        color: grey,
                      ),
                      items: cities ?? [],
                      currentValue:
                          (isAr ? selectedCity?.name : selectedCity?.nameEn),
                      onChanged: (value) {
                        selectedCity = app.citiesModel?.firstWhere(
                            (e) => (isAr ? e.name : e.nameEn) == value);
                        setState(() {});
                      },
                    );
                  }),
                  TextFieldInput(
                    controller: TextEditingController(text: startDate),
                    hint: 'Start_Date'.trans,
                    readOnly: true,
                    prefixIcon: Icon(
                      Icons.calendar_month,
                      color: grey,
                    ),
                    onTap: () async {
                      startDate = await datePicker(context);
                      setState(() {});
                    },
                  ),
                  TextFieldInput(
                      controller: TextEditingController(
                        text: '',
                      ),
                      hint: 'Passengers'.trans,
                      readOnly: true,
                      prefixIcon: Icon(
                        Icons.groups,
                        color: grey,
                      ),
                      onTap: () {}),
                  TextFieldInput(
                    controller: TextEditingController(
                      text: '',
                    ),
                    hint: 'Room'.trans,
                    readOnly: true,
                    prefixIcon: Icon(
                      Icons.hotel,
                      color: grey,
                    ),
                    onTap: () async {},
                  ),
                  SizedBox(
                    height: Appheight / 10,
                  ),
                  Button(
                      height: Appheight / 18,
                      width: Appwidth / 1.3,
                      onpress: () {},
                      borderRadius: 20,
                      text: "Search_Programs".trans,
                      size: 20,
                      textColor: white,
                      buttonColor: defultblue),
                  SizedBox(
                    height: Appheight / 30,
                  ),
                ]),
              )
            ]),
          )),
    );
  }
}
