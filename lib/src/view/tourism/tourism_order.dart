import 'package:flrx_validator/flrx_validator.dart';
import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/button.dart';
import 'package:season/src/view/widgets/main_textfield.dart';
import 'package:season/src/view/widgets/text.dart';
import 'package:season/src/view/auth/widget/bottom_sheet_faild.dart';

class TourismOrder extends StatefulWidget {
  const TourismOrder({super.key});

  @override
  State<TourismOrder> createState() => _TourismOrderState();
}

class _TourismOrderState extends State<TourismOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: defultblue,
          title: CustomText(
            text: 'Tourism_Programme_Booking'.trans,
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
                    text: 'Meal_Type'.trans,
                    size: 16,
                  ),
                  CustomText(
                    text: 'Transport_Type'.trans,
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
                      hint: '-----',
                      readOnly: true,
                    ),
                  ),
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      filledColor: greyWhite,
                      hint: '-----',
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: 'Child_Reservation'.trans,
                size: 16,
              ),
              SizedBox(
                height: 10,
              ),
              MainTextField(
                filledColor: greyWhite,
                hint: 'none	',
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Room_Type'.trans,
                    size: 16,
                  ),
                  CustomText(
                    text: 'Child_Count_In_Room'.trans,
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
                      hint: 'Single Room',
                      readOnly: true,
                    ),
                  ),
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      filledColor: greyWhite,
                      hint: '	0',
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: 'city'.trans,
                size: 16,
              ),
              SizedBox(
                height: 10,
              ),
              MainTextField(
                filledColor: greyWhite,
                hint: 'BATUMI		',
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Check_In'.trans,
                    size: 16,
                  ),
                  CustomText(
                    text: 'Check_Out'.trans,
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
                      hint: '	2023-11-09',
                      readOnly: true,
                    ),
                  ),
                  SizedBox(
                    width: Appwidth / 2.6,
                    child: MainTextField(
                      filledColor: greyWhite,
                      hint: '		2023-11-09',
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: 'Hotel_Name'.trans,
                size: 16,
              ),
              SizedBox(
                height: 10,
              ),
              MainTextField(
                filledColor: greyWhite,
                hint: 'Cairo Hotel',
                readOnly: true,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Number_Of_Adults'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              MainTextField(
                filledColor: greyWhite,
                hint: '1',
                readOnly: true,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Single_Room_Price'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              MainTextField(
                filledColor: greyWhite,
                hint: '\$4.00',
                readOnly: true,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Total'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              MainTextField(
                filledColor: greyWhite,
                hint: '\$4.00',
                readOnly: true,
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
              const SizedBox(height: 10),
              CustomText(
                text: 'Nationality'.trans,
                size: 16,
              ),
              const SizedBox(height: 10),
              MainTextField(
                hint: 'Nationality'.trans,
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
                onpress: () async {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      builder: (context) {
                        return faildBottomSheet();
                      });
                },
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
