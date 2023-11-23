import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/provider/flight_provider.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/date_picker.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/button.dart';
import 'package:season/src/view/widgets/main_textfield.dart';
import 'package:season/src/view/widgets/text.dart';
import 'package:season/src/view/home/pages/passengers_page.dart';

class FlightPage extends StatefulWidget {
  FlightPage({super.key});

  @override
  State<FlightPage> createState() => _FlightPageState();
}

class _FlightPageState extends State<FlightPage> {
  String? startDate;
  String? endDate;

  int? adultsNum;
  int? childrenNum;
  int? infantsNum;
  int index = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      Provider.of<FlightProvider>(context, listen: false).getAirports();
    });
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final flightProvider = Provider.of<FlightProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
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
                    text: "ROUNDTRIP".trans,
                    size: 18,
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
                    text: "ONE_WAY".trans,
                    size: 18,
                    color: white,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: defultblue,
          title: Text("Flight".trans),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
             
                // SizedBox(height: 16),
               
                // SizedBox(height: 16),
                TextFieldInput(
                  controller: TextEditingController(text: startDate),
                  label: 'Start_Date'.trans,
                  readOnly: true,
                  prefixIcon: Icon(
                    Icons.calendar_month,
                    color: grey,
                  ),
                  onTap: () async {
                    startDate = await datePicker(context);
                    setState(() {});
                  },
                  validator: (value) => null,
                ),
                if (index == 0) ...{
                  // SizedBox(height: 16),
                  TextFieldInput(
                    controller: TextEditingController(text: endDate),
                    label: 'End_Date'.trans,
                    readOnly: true,
                    prefixIcon: Icon(
                      Icons.calendar_month,
                      color: grey,
                    ),
                    onTap: () async {
                      endDate = await datePicker(context);
                      setState(() {});
                    },
                    validator: (value) => null,
                  ),
                },
                // SizedBox(height: 16),
                TextFieldInput(
                  controller: TextEditingController(
                    text: '',
                  ),
                  label: 'Passengers'.trans,
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
                  validator: (value) => null,
                ),
                SizedBox(height: 16),
                Button(
                    height: Appheight / 18,
                    width: Appwidth / 1.3,
                    onpress: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    borderRadius: 20,
                    text: "Search_Flights".trans,
                    size: 20,
                    textColor: white,
                    buttonColor: defultblue),
                SizedBox(
                  height: Appheight / 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
