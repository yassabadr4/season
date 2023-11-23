import 'package:flutter/material.dart';
import 'package:season/src/app/data/dio/dio_client.dart';
import 'package:season/src/app/data/models/flight_model.dart';

export 'package:provider/provider.dart';

class FlightProvider extends ChangeNotifier {
  final _api = DioClient.instance;

  List<FlightsModel>? flightsModel;

  bool isAirportsLoad = false;
  Future<void> getAirports() async {
    isAirportsLoad = true;
    notifyListeners();
  }
}
