import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/data/models/flight_model.dart';
import 'package:season/src/app/provider/flight_provider.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/text.dart';

class TicketContainer extends StatelessWidget {
  final VoidCallback onPress;

  const TicketContainer({
    super.key,
    required this.onPress,
    required this.flightsModel,
  });
  final FlightsModel flightsModel;

  @override
  Widget build(BuildContext context) {
    final flightProvider = Provider.of<FlightProvider>(context);
    return SizedBox(
      width: Appwidth,
      child: Padding(
        padding: EdgeInsets.only(bottom: Appheight / 90),
        child: GestureDetector(
          onTap: onPress,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            elevation: 10,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 15, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: darkblue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.airplane_ticket,
                                        size: 18,
                                        color: white,
                                      ),
                                      SizedBox(width: 4),
                                      CustomText(
                                        text: "Departure".trans,
                                        size: 10,
                                        color: white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            Image.asset(
                              "assets/image/Flyjord.png",
                              height: Appheight / 20,
                              width: Appwidth / 5,
                              fit: BoxFit.cover,
                            ),
                            CustomText(
                              text: "فلاي جوردن",
                              size: 12,
                              color: yellow,
                            ),
                            CustomText(
                              text: flightsModel.flightNumber ?? '',
                              size: 12,
                              color: black,
                            ),
                          ],
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        FittedBox(
                                          child: CustomText(
                                            text: flightsModel.departureTime ??
                                                '',
                                            size: 11,
                                            color: black,
                                          ),
                                        ),
                                        CustomText(
                                          text: '',
                                          size: 11,
                                          color: black,
                                        ),
                                        FittedBox(
                                          child: CustomText(
                                            text: flightsModel.departureDate ??
                                                '',
                                            size: 11,
                                            color: black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Divider(
                                        color: yellow,
                                        thickness: 2,
                                        height: 2,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        FittedBox(
                                          child: CustomText(
                                            text:
                                                flightsModel.arrivalTime ?? '',
                                            size: 11,
                                            color: black,
                                          ),
                                        ),
                                        CustomText(
                                          text: '',
                                          size: 11,
                                          color: black,
                                        ),
                                        FittedBox(
                                          child: CustomText(
                                            text: flightsModel.arrivDate ?? '',
                                            size: 11,
                                            color: black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    CustomText(
                                      text: flightsModel.numStops == '0'
                                          ? 'Direct'
                                          : '${flightsModel.numStops} Stops',
                                      size: 12,
                                      color: black,
                                    ),
                                    CustomText(
                                      text:
                                          "Trip Duration: ${flightsModel.durationHours}",
                                      size: 12,
                                      color: black,
                                    ),
                                    CustomText(
                                      text: "${flightsModel.allowedWeight} Kg",
                                      size: 12,
                                      color: black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    ///
                    /// Return
                    ///
                    if (flightsModel.allowReturn == '1') ...{
                      Divider(),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: darkblue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.airplane_ticket,
                                          size: 18,
                                          color: white,
                                        ),
                                        SizedBox(width: 4),
                                        CustomText(
                                          text: "Return",
                                          size: 10,
                                          color: white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              Image.asset(
                                "assets/image/Flyjord.png",
                                height: Appheight / 20,
                                width: Appwidth / 5,
                                fit: BoxFit.cover,
                              ),
                              CustomText(
                                text: "فلاي جوردن",
                                size: 12,
                                color: yellow,
                              ),
                              CustomText(
                                text: flightsModel.returnFlightNumber ?? '',
                                size: 12,
                                color: black,
                              ),
                            ],
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          FittedBox(
                                            child: CustomText(
                                              text:
                                                  flightsModel.returnEndDate1 ??
                                                      '',
                                              size: 11,
                                              color: black,
                                            ),
                                          ),
                                          CustomText(
                                            text: '',
                                            size: 11,
                                            color: black,
                                          ),
                                          FittedBox(
                                            child: CustomText(
                                              text: flightsModel
                                                      .returnStartDate ??
                                                  '',
                                              size: 11,
                                              color: black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Divider(
                                          color: yellow,
                                          thickness: 2,
                                          height: 2,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          FittedBox(
                                            child: CustomText(
                                              text:
                                                  flightsModel.returnEndDate2 ??
                                                      '',
                                              size: 11,
                                              color: black,
                                            ),
                                          ),
                                          CustomText(
                                            text: '',
                                            size: 11,
                                            color: black,
                                          ),
                                          FittedBox(
                                            child: CustomText(
                                              text:
                                                  flightsModel.returnEndDate ??
                                                      '',
                                              size: 11,
                                              color: black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      CustomText(
                                        text: (flightsModel.numStopsReturn ==
                                                    '0' ||
                                                flightsModel.numStopsReturn ==
                                                    '')
                                            ? 'Direct'
                                            : '${flightsModel.numStopsReturn} Stops',
                                        size: 12,
                                        color: black,
                                      ),
                                      flightsModel.hoursArriv == ''
                                          ? SizedBox()
                                          : CustomText(
                                              text:
                                                  "Trip Duration: ${flightsModel.hoursArriv}",
                                              size: 12,
                                              color: black,
                                            ),
                                      flightsModel.allowedWeightReturn == ''
                                          ? SizedBox()
                                          : CustomText(
                                              text:
                                                  "${flightsModel.allowedWeightReturn} Kg",
                                              size: 12,
                                              color: black,
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    },
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
