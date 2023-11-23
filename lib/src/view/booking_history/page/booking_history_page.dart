import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/booking_history/page/car_archive.dart';
import 'package:season/src/view/booking_history/page/flight_archive.dart';
import 'package:season/src/view/booking_history/page/hotel_archive.dart';
import 'package:season/src/view/booking_history/page/program_archive.dart';
import 'package:season/src/view/widgets/text.dart';
import 'package:season/src/view/booking_history/widget/archive_con.dart';

class BookingHistoryPage extends StatelessWidget {
  const BookingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Booking_history".trans,
        ),
        backgroundColor: defultblue,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: Appheight / 1.3,
            child: ListView(
              children: [
                ArchiveContainer(
                  text: 'Flight_Booking'.trans,
                  icon: Icons.airplanemode_active,
                  onpress: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FlightArchivePage(),
                      )),
                ),
                ArchiveContainer(
                  onpress: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarArchivePage(),
                      )),
                  text: 'Car_booking'.trans,
                  icon: Icons.car_crash,
                ),
                ArchiveContainer(
                  onpress: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProgramArchivePage(),
                      )),
                  text: 'program_Booking'.trans,
                  icon: Icons.tour,
                ),
                ArchiveContainer(
                  onpress: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HotelArchive(),
                      )),
                  text: 'Hotel_Booking'.trans,
                  icon: Icons.house,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
