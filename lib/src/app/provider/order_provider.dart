import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:season/src/app/data/dio/dio_client.dart';
import 'package:season/src/app/data/models/cars_type.dart';

export 'package:provider/provider.dart';

class OrderProvider extends ChangeNotifier {
  final _api = DioClient.instance;
  bool isload = false;

  // TextEditingController typeId = TextEditingController();
  TextEditingController widthDriver = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController totalDays = TextEditingController();
  // TextEditingController totalAmount = TextEditingController();
  // TextEditingController tax = TextEditingController();
  // TextEditingController netAmount = TextEditingController();
  TextEditingController accountOwner = TextEditingController();
  TextEditingController notes = TextEditingController();

  
}
