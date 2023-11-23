import 'package:flutter/material.dart';
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
import 'package:season/src/view/hotels/hotel_result.dart';
import 'package:season/src/view/home/pages/room_page.dart';


class HotelsPage extends StatefulWidget {
  HotelsPage({super.key});

  @override
  State<HotelsPage> createState() => _HotelsPageState();
}

class _HotelsPageState extends State<HotelsPage> {
  String? startDate;
  String? endDate;
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
            title: Text("Hotels".trans),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
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
                  // SizedBox(height: 16),
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
                  // SizedBox(height: 16),
                  TextFieldInput(
                    controller: TextEditingController(text: endDate),
                    hint: 'End_Date'.trans,
                    readOnly: true,
                    prefixIcon: Icon(
                      Icons.calendar_month,
                      color: grey,
                    ),
                    onTap: () async {
                      endDate = await datePicker(context);
                      setState(() {});
                    },
                  ),
                  TextFieldInput(
                    controller: TextEditingController(
                      text: (adultsNum != null ||
                              childrenNum != null ||
                              infantsNum != null)
                          ? '(${adultsNum != null ? '${adultsNum} Adults' : ''}${childrenNum != null ? '${adultsNum != null ? ' - ' : ''}${childrenNum} Children' : ''}${infantsNum != null ? '${(adultsNum != null || childrenNum != null) ? ' - ' : ''}${infantsNum} Infants' : ''})'
                          : '',
                    ),
                    hint: 'Passengers'.trans,
                    readOnly: true,
                    prefixIcon: Icon(
                      Icons.groups,
                      color: grey,
                    ),
                    onTap: () async {
                      var results = await showModalBottomSheet(
                          isScrollControlled: true,
                          useSafeArea: true,
                          context: context,
                          builder: (context) {
                            return PassengersPage(
                              data: [adultsNum, childrenNum, infantsNum],
                            );
                          });
                      if (results.runtimeType == List<int>) {
                        adultsNum = results[0] == 0 ? null : results[0];
                        childrenNum = results[1] == 0 ? null : results[1];
                        infantsNum = results[2] == 0 ? null : results[2];
                        print(results);
                        setState(() {});
                      } else {
                        print(results.runtimeType);
                      }
                    },
                  ),
                  TextFieldInput(
                    controller: TextEditingController(
                      text: (adultsNum != null ||
                              childrenNum != null ||
                              infantsNum != null)
                          ? '(${adultsNum != null ? '${adultsNum} Adults' : ''}${childrenNum != null ? '${adultsNum != null ? ' - ' : ''}${childrenNum} Children' : ''}${infantsNum != null ? '${(adultsNum != null || childrenNum != null) ? ' - ' : ''}${infantsNum} Infants' : ''})'
                          : '',
                    ),
                    hint: 'Room'.trans,
                    readOnly: true,
                    prefixIcon: Icon(
                      Icons.hotel,
                      color: grey,
                    ),
                    onTap: () async {
                      var results = await showModalBottomSheet(
                          isScrollControlled: true,
                          useSafeArea: true,
                          context: context,
                          builder: (context) {
                            return RoomPage(
                              data: [adultsNum, childrenNum, infantsNum],
                            );
                          });
                      if (results.runtimeType == List<int>) {
                        adultsNum = results[0] == 0 ? null : results[0];
                        childrenNum = results[1] == 0 ? null : results[1];
                        infantsNum = results[2] == 0 ? null : results[2];
                        print(results);
                        setState(() {});
                      } else {
                        print(results.runtimeType);
                      }
                    },
                  ),
                  SizedBox(
                    height: Appheight / 10,
                  ),
                  Button(
                      height: Appheight / 18,
                      width: Appwidth / 1.3,
                      onpress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HotelResultPage()),
                        );
                      },
                      borderRadius: 20,
                      text: "Search_hotel".trans,
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
