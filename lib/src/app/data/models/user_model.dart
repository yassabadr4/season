import 'package:quiver/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  int? id;
  String? name;


  String? email;
  bool? emailVerifiedAt;
  String? photo;
  bool? isDelete;
  bool? isActive;
  UserModel(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.photo});

  UserModel.fromJson(Map<String, dynamic> json, {String? token}) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    if (json["photo"] != null) {
      photo = json["photo"].startsWith('http')
          ? json["photo"]
          : '${json["photo"]}';
    }
    if (isNotBlank(token)) saveToken('Bearer $token');
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'photo': photo,
      };

  static Future<String?> get getToken async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<bool> get isLoggedIn async => await getToken != null;

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
}
