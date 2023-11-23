import 'package:season/main.dart';
import 'package:season/src/app/localization/ys_localizations_provider.dart';

class CarsViewModel {
  String? id;
  String? typeId;
  String? tax;
  String? pricePerDay;
  String? priceWithDriver;
  String? imagePath;
  String? status;
  String? _typeArabicName;
  String? _typeEnglishName;
  String? typeImage;

  CarsViewModel(
      {this.id,
      this.typeId,
      this.tax,
      this.pricePerDay,
      this.priceWithDriver,
      this.imagePath,
      this.status,
      this.typeImage});

  bool get isAr =>
      YsLocalizationsProvider.listenFalse(NavigationService.context)
          .languageCode ==
      'ar';
  String get typeName => (isAr ? _typeArabicName : _typeEnglishName) ?? '';

  CarsViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeId = json['type_id'];
    tax = json['tax'];
    pricePerDay = json['price_per_day'];
    priceWithDriver = json['price_with_driver'];
    imagePath = json['image_path'];
    status = json['status'];
    _typeArabicName = json['type_arabic_name'];
    _typeEnglishName = json['type_english_name'];
    if (json["type_image"] != null) {
      typeImage = json["type_image"].startsWith('http')
          ? json["type_image"]
          : 'https://api.seasonsge.com/images/Agents/${json["type_image"]}';
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_id'] = this.typeId;
    data['tax'] = this.tax;
    data['price_per_day'] = this.pricePerDay;
    data['price_with_driver'] = this.priceWithDriver;
    data['image_path'] = this.imagePath;
    data['status'] = this.status;
    data['type_arabic_name'] = this._typeArabicName;
    data['type_english_name'] = this._typeEnglishName;
    data['type_image'] = this.typeImage;
    return data;
  }
}
