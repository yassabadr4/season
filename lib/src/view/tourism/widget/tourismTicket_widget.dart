import 'package:flutter/material.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/view/widgets/text.dart';

class TourismTicketContainer extends StatelessWidget {
  final VoidCallback onPress;
  const TourismTicketContainer({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.5,
      width: MediaQuery.of(context).size.width / 1.1,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 90),
        child: GestureDetector(
          onTap: onPress,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/image/hotel.jpg"),
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.1),
                    BlendMode.softLight,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 18),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "BATUMI & TRABZON",
                        weight: FontWeight.bold,
                        color: white,
                        size: 18,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: "4 days  & 3 night",
                        color: white,
                        weight: FontWeight.bold,
                        size: 18,
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
