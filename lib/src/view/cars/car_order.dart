import 'package:dio/dio.dart';
import 'package:flrx_validator/flrx_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/data/models/cars_type.dart';
import 'package:season/src/app/provider/order_provider.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/button.dart';
import 'package:season/src/view/widgets/custom_snackbar.dart';
import 'package:season/src/view/widgets/main_textfield.dart';
import 'package:season/src/view/widgets/text.dart';

// ignore: must_be_immutable
class CarOrderPage extends StatefulWidget {
  CarsViewModel? model;
  CarOrderPage(
      {super.key,
      this.model,
      required this.startDate,
      required this.endDate,
      required this.days});
  final DateTime startDate;
  final DateTime endDate;
  final int days;
  @override
  State<CarOrderPage> createState() => _CarOrderPageState();
}

class _CarOrderPageState extends State<CarOrderPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderProvider>(
      create: (_) => OrderProvider(),
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: defultblue,
          title: CustomText(
            text: 'Booking_Car'.trans,
          ),
        ),
        body: Builder(builder: (context) {
          final orderProvider = Provider.of<OrderProvider>(context);
          double price = orderProvider.widthDriver.text == 'with'
              ? (double.tryParse(widget.model?.priceWithDriver ?? '0.0') ?? 0)
              : (double.tryParse(widget.model?.pricePerDay ?? '0.0') ?? 0);
          orderProvider.startDate.text =
              widget.startDate.toString().split(' ').first;
          orderProvider.endDate.text =
              widget.endDate.toString().split(' ').first;
          orderProvider.totalDays.text = widget.days.toString();
          return Form(
            key: _formKey,
            autovalidateMode: _autoValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "car_type".trans,
                          size: 16,
                        ),
                        CustomText(
                          text: 'Price'.trans,
                          size: 16,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Appwidth / 2.6,
                          child: MainTextField(
                            filledColor: greyWhite,
                            hint: '${widget.model!.typeName}',
                            readOnly: true,
                          ),
                        ),
                        SizedBox(
                          width: Appwidth / 2.6,
                          child: MainTextField(
                            init: '$price',
                            filledColor: greyWhite,
                            hint: '\$0.00',
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    CustomText(
                      text: 'Driver'.trans,
                      size: 16,
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      // Show bottomSheet
                      onTap: () async {
                        await showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            )),
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  return Padding(
                                    padding: const EdgeInsets.all(25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: "Chose_with_or_without_Driver"
                                              .trans,
                                          size: 18,
                                          weight: FontWeight.w600,
                                          color: grey,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        if ((double.tryParse(widget.model
                                                        ?.priceWithDriver ??
                                                    '0.0') ??
                                                0.0) >
                                            0) ...{
                                          RadioListTile(
                                            title: CustomText(
                                              text: "with_Driver".trans,
                                              size: 18,
                                            ),
                                            value: "with_Driver".trans,
                                            groupValue:
                                                orderProvider.widthDriver.text,
                                            onChanged: (value) {
                                              orderProvider.widthDriver.text =
                                                  value.toString();
                                              Navigator.pop(context);
                                            },
                                          ),
                                        },
                                        RadioListTile(
                                          title: CustomText(
                                            text: "without_Driver".trans,
                                            size: 18,
                                          ),
                                          value: "without_Driver".trans,
                                          groupValue:
                                              orderProvider.widthDriver.text,
                                          onChanged: (value) {
                                            orderProvider.widthDriver.text =
                                                value.toString();
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            });
                        setState(() {});
                      },
                      child: MainTextField(
                        enable: false,
                        controller: TextEditingController(
                            text: orderProvider.widthDriver.text.toUpperCase()),
                        prefixIcon: Icon(
                          Icons.car_crash,
                          color: grey,
                        ),
                        suffixIcon: Icon(Icons.arrow_downward_outlined),
                        hint: "Chose_with_or_without_Driver".trans,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Start_Date'.trans,
                          size: 16,
                        ),
                        CustomText(
                          text: 'End_Date'.trans,
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
                            controller: orderProvider.startDate,
                            hint: '27-10-2023',
                            filledColor: greyWhite,
                            readOnly: true,
                          ),
                        ),
                        SizedBox(
                          width: Appwidth / 2.6,
                          child: MainTextField(
                            controller: orderProvider.endDate,
                            hint: '27-10-2023',
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
                          text: "day_num".trans,
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
                            controller: orderProvider.totalDays,
                            hint: '1',
                            filledColor: greyWhite,
                            readOnly: true,
                          ),
                        ),
                        SizedBox(
                          width: Appwidth / 2.6,
                          child: MainTextField(
                            init:
                                '${(price * (int.tryParse(orderProvider.totalDays.text.isNotEmpty ? orderProvider.totalDays.text : '1') ?? 1)).toStringAsFixed(2)}',
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
                            init: widget.model?.tax ?? '',
                            hint: '0%',
                            filledColor: greyWhite,
                            readOnly: true,
                          ),
                        ),
                        SizedBox(
                          width: Appwidth / 2.6,
                          child: MainTextField(
                            init:
                                '${(price * (int.tryParse(orderProvider.totalDays.text.isNotEmpty ? orderProvider.totalDays.text : '1') ?? 1) * ((100 - (double.tryParse(widget.model?.tax ?? '0.0') ?? 0)) / 100)).toStringAsFixed(2)}',
                            hint: '\$0.00',
                            filledColor: greyWhite,
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    CustomText(
                      text: "First_Name".trans,
                      size: 16,
                    ),
                    const SizedBox(height: 10),
                    MainTextField(
                      controller: orderProvider.firstName,
                      hint: "First_Name".trans,
                      validator: Validator(
                        rules: [
                          RequiredRule(
                              validationMessage: "fName_requird".trans),
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
                      controller: orderProvider.lastName,
                      hint: 'Last_Name'.trans,
                      validator: Validator(
                        rules: [
                          RequiredRule(
                              validationMessage: "lName_requird".trans),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomText(
                      text: "Phone_Number".trans,
                      size: 16,
                    ),
                    const SizedBox(height: 10),
                    MainTextField(
                      controller: orderProvider.phoneNumber,
                      hint: "Phone_Number".trans,
                      validator: Validator(
                        rules: [
                          MinLengthRule(8,
                              validationMessage: "Phone_length".trans),
                          RequiredRule(
                              validationMessage: "Phone_validation".trans),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomText(
                      text: 'Notes'.trans,
                      size: 16,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: orderProvider.notes,
                      maxLines: 7,
                      decoration: InputDecoration(
                        hintText: 'Please_put_place_to_recieve_the_car'.trans,
                        hintStyle: TextStyle(
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
