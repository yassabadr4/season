import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/button.dart';
import 'package:season/src/view/widgets/custom_snackbar.dart';
import 'package:season/src/view/widgets/main_textfield.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/view/widgets/text.dart';
import 'package:table_calendar/table_calendar.dart';

class CarsMainPage extends StatefulWidget {
  const CarsMainPage({super.key});
  @override
  State<CarsMainPage> createState() => _CarsMainPageState();
}

class _CarsMainPageState extends State<CarsMainPage> {
  String? country;
  DateTime? _startDate;
  DateTime? _endDate;
  int? days;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: defultblue,
        title: Text("Cars".trans),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          SizedBox(height: Appheight / 30),
          GestureDetector(
            onTap: () async {
              await showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'country'.trans,
                                size: 22,
                                weight: FontWeight.w600,
                                color: Colors.grey[700],
                              ),
                              RadioListTile(
                                title: CustomText(
                                  text: "TURKEY".trans,
                                  size: 22,
                                ),
                                value: "TURKEY".trans,
                                groupValue: country,
                                onChanged: (value) {
                                  country = value.toString();
                                  Navigator.pop(context);
                                },
                              ),
                              RadioListTile(
                                title: CustomText(
                                  text: "GEORGIA".trans,
                                  size: 22,
                                ),
                                value: "GEORGIA".trans,
                                groupValue: country,
                                onChanged: (value) {
                                  country = value.toString();
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        );
                      },
                    );
                  });
              setState(() {});
            },
            child: MainTextField(
              enable: false,
              keyboardType: TextInputType.emailAddress,
              controller: TextEditingController(text: country ?? ""),
              prefixIcon: Icon(
                Icons.flag_outlined,
                color: grey,
              ),
              hint: 'country'.trans,
            ),
          ),
          SizedBox(height: Appheight / 30),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                builder: (BuildContext context) {
                  return Column(
                    children: <Widget>[
                      TableCalendar(
                        firstDay: DateTime(2000),
                        lastDay: DateTime(2050),
                        focusedDay: DateTime.now(),
                        calendarFormat: CalendarFormat.month,
                        calendarStyle: CalendarStyle(
                          selectedDecoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          todayDecoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                        ),
                        selectedDayPredicate: (date) {
                          return isSameDay(_startDate, date);
                        },
                        onDaySelected: (date, focusedDay) {
                          setState(() {
                            // orderProvider.startDate.text =
                            //     date.toString().split(' ').first;
                            _startDate = date;
                            if (_startDate != null && _endDate != null) {
                              days = _endDate!.difference(_startDate!).inDays;
                            }
                          });
                          Navigator.pop(context);
                        },
                        calendarBuilders: CalendarBuilders(
                          selectedBuilder: (context, date, _) => Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                date.day.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: MainTextField(
              controller: TextEditingController(
                  text: _startDate == null
                      ? ''
                      : _startDate.toString().split(' ').first),
              enable: false,
              keyboardType: TextInputType.datetime,
              prefixIcon: Icon(
                Icons.calendar_month,
                color: grey,
              ),
              hint: "Start_Date".trans,
            ),
          ),
          SizedBox(height: Appheight / 30),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                builder: (BuildContext context) {
                  return Column(
                    children: <Widget>[
                      TableCalendar(
                        firstDay: DateTime(2000),
                        lastDay: DateTime(2050),
                        focusedDay: DateTime.now(),
                        calendarFormat: CalendarFormat.month,
                        calendarStyle: CalendarStyle(
                          selectedDecoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          todayDecoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                        ),
                        selectedDayPredicate: (date) {
                          return isSameDay(_endDate, date);
                        },
                        onDaySelected: (date, focusedDay) {
                          setState(() {
                            // orderProvider.endDate.text =
                            //     date.toString().split(' ').first;
                            _endDate = date;
                            if (_startDate != null && _endDate != null) {
                              days = _endDate!.difference(_startDate!).inDays;
                            }
                          });
                          Navigator.pop(context);
                        },
                        calendarBuilders: CalendarBuilders(
                          selectedBuilder: (context, date, _) => Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                date.day.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: MainTextField(
              controller: TextEditingController(
                  text: _endDate == null
                      ? ''
                      : _endDate.toString().split(' ').first),
              enable: false,
              keyboardType: TextInputType.datetime,
              prefixIcon: Icon(
                Icons.calendar_month,
                color: grey,
              ),
              hint: "End_Date".trans,
            ),
          ),
          SizedBox(height: Appheight / 15),
          Button(
              height: Appheight / 18,
              width: Appwidth / 1.3,
              onpress: () {
                if (country != null && _startDate != null && _endDate != null) {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => CaravailablePage(
                  //             startDate: _startDate!,
                  //             endDate: _endDate!,
                  //             days: days!,
                  //           )),
                  // );
                } else {
                  showCustomSnackBar('Please_Select_all_data'.trans, context,
                      isError: true);
                }
              },
              borderRadius: 20,
              text: "Search_Cars".trans,
              size: 20,
              textColor: white,
              buttonColor: defultblue),
          SizedBox(
            height: Appheight / 30,
          ),
        ]),
      ),
    );
  }
}
