import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/view/hotels/hotel_order.dart';
import 'package:season/src/view/widgets/text.dart';
import 'package:season/src/view/hotels/widget/hotelTicket_widget.dart';

class HotelResultPage extends StatefulWidget {
  const HotelResultPage({super.key});

  @override
  State<HotelResultPage> createState() => _HotelResultPageState();
}

class _HotelResultPageState extends State<HotelResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defultblue,
        title: CustomText(
          text: "Research_Results".trans,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomText(
                text: "Hotel_information".trans,
                size: 18,
                weight: FontWeight.bold,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, i) {
                return HotelTicketContainer(
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HotelOrderPage(),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
