import 'package:flutter/material.dart';
import 'package:season/src/app/data/dio/dio_client.dart';
import 'package:season/src/app/data/models/hotels_model.dart';

export 'package:provider/provider.dart';

class HotelProvider extends ChangeNotifier {
  final _api = DioClient.instance;

  HotelsModel? hotelsModel;

  bool isAllHotelsLoad = false;
  Future<void> getAllHotels() async {
    isAllHotelsLoad = true;
    notifyListeners();

    isAllHotelsLoad = false;
    notifyListeners();
  }
}
