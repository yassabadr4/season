import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/text.dart';
import 'package:season/src/view/cars/car.dart';
import 'package:season/src/view/flight/flight.dart';
import 'package:season/src/view/hotels/hotels.dart';
import 'package:season/src/view/tourism/tourism.dart';
import 'package:season/src/view/home/widget/MainPage_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: Appheight / 3.5,
          width: double.infinity,
          color: defultblue,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: CustomText(
                text: "All_you_need".trans,
                size: 18,
                color: white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 10, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconsForMainPage(
                    onpress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlightPage(),
                        ),
                      );
                    },
                    backgroundColor: darkblue,
                    icon: const Icon(
                      Icons.airplanemode_active,
                      color: white,
                    ),
                    text: 'Flight'.trans,
                  ),
                  IconsForMainPage(
                    onpress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HotelsPage(),
                        ),
                      );
                    },
                    backgroundColor: darkblue,
                    icon: const Icon(
                      Icons.house,
                      color: white,
                    ),
                    text: 'Hotels'.trans,
                  ),
                  IconsForMainPage(
                    onpress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TourismPage()),
                      );
                    },
                    backgroundColor: darkblue,
                    icon: const Icon(
                      Icons.tour,
                      color: white,
                    ),
                    text: 'Tourism'.trans,
                  ),
                  IconsForMainPage(
                    onpress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CarsMainPage()),
                      );
                    },
                    backgroundColor: darkblue,
                    icon: const Icon(
                      Icons.car_crash,
                      color: white,
                    ),
                    text: 'Cars'.trans,
                  ),
                  IconsForMainPage(
                    onpress: _launchUrl,
                    backgroundColor: darkblue,
                    icon: const Icon(
                      Icons.train,
                      color: white,
                    ),
                    text: 'Trains'.trans,
                  ),
                ],
              ),
            ),
          ]),
        ),
        Padding(
          padding: EdgeInsets.only(top: 200, bottom: 100),
          child: Column(
            children: [
              CustomText(text: "no_offers".trans),
              CustomText(text: "stay_tuned".trans),
            ],
          ),
        ),
      ]),
    );
  }

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse('https://tre.ge/en');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
