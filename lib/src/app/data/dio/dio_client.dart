import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:season/src/app/data/models/user_model.dart';
import 'package:season/src/app/utils/app_constants.dart';

class DioClient {
  //Singleton
  DioClient._() {
    // Attach Logger
    if (kDebugMode) _dio.interceptors.add(_logger);
    _dio.options.responseType = ResponseType.json;
  }
  static final DioClient instance = DioClient._();
  // Http Client
  final Dio _dio = Dio();
  // Logger
  final PrettyDioLogger _logger = PrettyDioLogger(
    requestBody: true,
    responseBody: true,
    requestHeader: true,
    error: true,
  );
  // Headers
  final Map<String, dynamic> _apiHeaders = <String, dynamic>{
    'Accept': 'application/json',
    'Content-Type': 'multipart/form-data',
  };

  ////////////////////////////// END POINTS ///////////////////////////////////
  static const String _registerEndPoint = "add-user";
  static const String _loginEndPoint = "login";
  static const String _updateProfileEndPoint = "user-edit";

  ////////////////////////////// METHODS //////////////////////////////////////

  Future<UserModel> register(UserModel user, String password) async {
    final response = await _dio.post(
      '${Connection.baseURL}$_registerEndPoint',
      data: FormData.fromMap({
        ...user.toJson(),
        'password': password,
        'type': 2,
        'discount': 0,
        'balance': 0,
        'token': 'token'
      }),
      options: Options(
        headers: _apiHeaders,
      ),
    );
    if (response.data['status'] == true && response.data['data'].isNotEmpty) {
      return UserModel.fromJson(response.data['data'],
          token: response.data['token']);
    } else {
      throw response.data;
    }
  }

  Future<UserModel> login(
    String email,
    String password,
  ) async {
    final response = await _dio.post(
      '${Connection.baseURL}$_loginEndPoint',
      data: {
        'email': email,
        'password': password,
      },
      options: Options(
        headers: _apiHeaders,
      ),
    );
    if (response.data['status'] == true && response.data['data'].isNotEmpty) {
      return UserModel.fromJson(response.data['data'],
          token: response.data['token']);
    } else {
      throw response.data;
    }
  }

  Future<UserModel> updateProfile({
    required String userName,
    required String email,
    String? password,
    File? image,
  }) async {
    final token = await _getUserToken();
    FormData data = FormData.fromMap({
      'first_name': userName,
      'email': email,
      if (password != null && password.length >= 8) ...{
        'password': password,
      },
      if (image != null) 'photo': await MultipartFile.fromFile(image.path),
    }, ListFormat.multiCompatible);

    final response = await _dio.post(
      '${Connection.baseURL}$_updateProfileEndPoint',
      data: data,
      queryParameters: {
        '_method': "PUT",
      },
      options: Options(
        headers: {
          ..._apiHeaders,
          'Authorization': token,
        },
      ),
    );
    if (response.data['status'] == true) {
      return UserModel.fromJson(response.data["data"]);
    } else {
      throw response.data;
    }
  }

  ///////////////////////////////// UTILS /////////////////////////////////////
  // Getting User Token.
  Future<String?> _getUserToken() async => await UserModel.getToken;
}
