import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/passenger_widget.dart';

class PassengersPage extends StatefulWidget {
  const PassengersPage({super.key, this.data});
  final List<int?>? data;

  @override
  State<PassengersPage> createState() => _PassengersPageState();
}

class _PassengersPageState extends State<PassengersPage> {
  int adultsNum = 0;
  int childrenNum = 0;
  int infantsNum = 0;

  @override
  void initState() {
    adultsNum = widget.data?[0] ?? 0;
    childrenNum = widget.data?[1] ?? 0;
    infantsNum = widget.data?[2] ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: Appheight / 14,
          color: defultblue,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Passengers'.trans,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context, [adultsNum, childrenNum, infantsNum]);
                },
                child: Icon(
                  Icons.done,
                  size: 30,
                  color: white,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              PassengersCounterWidget(
                counter: adultsNum,
                icon: Icons.person_3_rounded,
                title: 'Adults'.trans,
                subTitle: '12_years'.trans,
                minusPressed: () {
                  if (adultsNum > 0) {
                    adultsNum--;
                  }
                  setState(() {});
                },
                plusPressed: () {
                  adultsNum++;
                  setState(() {});
                },
              ),
              PassengersCounterWidget(
                counter: childrenNum,
                icon: Icons.child_care_rounded,
                title: 'Children'.trans,
                subTitle: '2_11_years'.trans,
                minusPressed: () {
                  if (childrenNum > 0) {
                    childrenNum--;
                  }
                  setState(() {});
                },
                plusPressed: () {
                  childrenNum++;
                  setState(() {});
                },
              ),
              PassengersCounterWidget(
                counter: infantsNum,
                icon: Icons.person,
                title: 'Infants'.trans,
                subTitle: '0_years'.trans,
                minusPressed: () {
                  if (infantsNum > 0) {
                    infantsNum--;
                  }
                  setState(() {});
                },
                plusPressed: () {
                  infantsNum++;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
