import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/localization/ys_localizations_provider.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/booking_history/page/booking_history_page.dart';
import 'package:season/src/view/Settings%20Pages/edit_profile.dart';
import 'package:season/src/view/Settings%20Pages/policy.dart';
import 'package:season/src/view/widgets/text.dart';
import 'widget/follow_us.dart';
import 'widget/setting_con.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: defultblue,
        title: CustomText(
          text: "Settings".trans,
          size: 18,
          color: white,
        ),
      ),
      body: Column(
        children: [
          SettingCount(
            onpress: () async {
              await YsLocalizationsProvider.listenFalse(context)
                  .setSavedLanguageCode(
                      YsLocalizationsProvider.listenFalse(context)
                                  .languageCode ==
                              'ar'
                          ? 'en'
                          : 'ar');
            },
            purfixIcon: Icon(
              Icons.language,
              color: defultblue,
            ),
            text: 'Language'.trans,
            suffixIcon: Icon(Icons.change_circle_outlined),
          ),
          const Divider(
            color: yellow,
            height: 2,
            thickness: 2,
          ),
          SettingCount(
            purfixIcon: Icon(
              Icons.groups_2,
              color: defultblue,
            ),
            text: 'AboutSeasonsTour'.trans,
            suffixIcon: Icon(Icons.arrow_forward_ios),
          ),
          SettingCount(
            purfixIcon: Icon(
              Icons.privacy_tip,
              color: defultblue,
            ),
            onpress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PolicyPage()),
              );
            },
            text: 'Privacy_Policy'.trans,
            suffixIcon: Icon(Icons.arrow_forward_ios),
          ),
          SettingCount(
            purfixIcon: Icon(
              Icons.chat,
              color: defultblue,
            ),
            text: 'Contact_Us'.trans,
            suffixIcon: Icon(Icons.arrow_forward_ios),
          ),
          SettingCount(
            onpress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },
            purfixIcon: Icon(
              Icons.person_outline,
              color: defultblue,
            ),
            text: 'account_setting'.trans,
            suffixIcon: Icon(Icons.arrow_forward_ios),
          ),
          SettingCount(
            onpress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookingHistoryPage()),
              );
            },
            purfixIcon: Icon(
              Icons.history,
              color: defultblue,
            ),
            text: 'Booking_history'.trans,
            suffixIcon: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(
            color: yellow,
            height: 2,
            thickness: 2,
          ),
          Spacer(),
          CustomText(
            text: "Follow_us_via".trans,
            size: 18,
            color: black,
            weight: FontWeight.bold,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: Appheight / 40,
          ),
          FollowUs(),
          SizedBox(
            height: Appheight / 20,
          ),
        ],
      ),
    );
  }
}
