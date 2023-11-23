import 'package:flutter/material.dart';
import 'package:season/src/app/data/dio/dio_client.dart';
import 'package:season/src/app/data/models/cars_type.dart';

export 'package:provider/provider.dart';

class CarsProvider extends ChangeNotifier {
  final _api = DioClient.instance;

  List<CarsViewModel>? cars;

  Future<void> getCars() async {}
}
