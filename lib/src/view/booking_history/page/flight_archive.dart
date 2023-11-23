import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/view/booking_history/widget/archive_widget.dart';
import 'package:season/src/view/widgets/text.dart';

class FlightArchivePage extends StatelessWidget {
  const FlightArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Flight_Booking".trans),
      ),
      body: Column(children: [ArchiveWidget()]),
    );
  }
}
