import 'package:flrx_validator/flrx_validator.dart';
import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/data/models/flight_model.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/button.dart';
import 'package:season/src/view/widgets/main_textfield.dart';
import 'package:season/src/view/widgets/text.dart';

class FlightOrderPage extends StatelessWidget {
  const FlightOrderPage({super.key, required this.flightsModel});
  final FlightsModel flightsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: defultblue,
          title: CustomText(
            text: 'Flight_Booking'.trans,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Flight_Number'.trans,
                    size: 16,
                  ),
                  CustomText(
                    text: 'Allow_Weight'.trans,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      filledColor: greyWhite,
                      hint: 'FJR500',
                      readOnly: true,
                    ),
                  ),
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      filledColor: greyWhite,
                      hint: '20.00',
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Stop_Number'.trans,
                    size: 16,
                  ),
                  CustomText(
                    text: 'Transit/Direct'.trans,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      filledColor: greyWhite,
                      hint: '0',
                      readOnly: true,
                    ),
                  ),
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      filledColor: greyWhite,
                      hint: 'Direct',
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Going_From'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              MainTextField(
                filledColor: greyWhite,
                hint: 'Queen Alia airport',
                readOnly: true,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Time_and_date'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      filledColor: greyWhite,
                      hint: '2023-11-20',
                      readOnly: true,
                    ),
                  ),
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      filledColor: greyWhite,
                      hint: '05:00:00',
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Going_To'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              MainTextField(
                filledColor: greyWhite,
                hint: 'Batumi Airport (BUS)',
                readOnly: true,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Arrival_time'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      filledColor: greyWhite,
                      hint: '2023-11-20',
                      readOnly: true,
                    ),
                  ),
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      filledColor: greyWhite,
                      hint: '08:30:00',
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Returning_from'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              MainTextField(
                filledColor: greyWhite,
                hint: 'Batumi Airport (BUS)',
                readOnly: true,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Time_and_date'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      filledColor: greyWhite,
                      hint: '2023-11-20',
                      readOnly: true,
                    ),
                  ),
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      filledColor: greyWhite,
                      hint: '08:30:00',
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Going_To'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              MainTextField(
                filledColor: greyWhite,
                hint: 'Batumi Airport (BUS)',
                readOnly: true,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Arrival_time'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      filledColor: greyWhite,
                      hint: '2023-11-20',
                      readOnly: true,
                    ),
                  ),
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      filledColor: greyWhite,
                      hint: '08:30:00',
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Adult_price".trans,
                    size: 16,
                  ),
                  CustomText(
                    text: 'Total'.trans,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      hint: '160000',
                      filledColor: greyWhite,
                      readOnly: true,
                    ),
                  ),
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      hint: '\$0.00',
                      filledColor: greyWhite,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Tax'.trans,
                    size: 16,
                  ),
                  CustomText(
                    text: 'Net_Total'.trans,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      hint: '0%',
                      filledColor: greyWhite,
                      readOnly: true,
                    ),
                  ),
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      hint: '\$0.00',
                      filledColor: greyWhite,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CustomText(
                text: 'First_Name'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              MainTextField(
                hint: 'First_Name'.trans,
                validator: Validator(
                  rules: [
                    RequiredRule(
                        validationMessage: 'First Name requird '.trans),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomText(
                text: 'Last_Name'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              MainTextField(
                hint: 'Last_Name'.trans,
                validator: Validator(
                  rules: [
                    RequiredRule(validationMessage: 'Last Name requird '.trans),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CustomText(
                text: 'Phone_Number'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              MainTextField(
                hint: 'Phone_Number'.trans,
                validator: Validator(
                  rules: [
                    MinLengthRule(8, validationMessage: 'Phone_length'.trans),
                    RequiredRule(validationMessage: 'Phone_validation'.trans),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CustomText(
                text: 'Passport_number'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              MainTextField(
                hint: 'Passport_number'.trans,
                validator: Validator(
                  rules: [
                    MinLengthRule(8, validationMessage: 'Phone_length'.trans),
                    RequiredRule(validationMessage: 'Phone_validation'.trans),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Button(
                text: 'Confirm_Booking'.trans,
                height: 50,
                onpress: () async {},
                buttonColor: defultblue,
                textColor: white,
                size: 20,
              ),
              SizedBox(height: 50),
            ]),
          ),
        ));
  }
}
