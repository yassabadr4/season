import 'package:flutter/material.dart';
import 'package:season/main.dart';

class EmailChecker {
  static bool isNotValid(String email) {
    return !RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}

class PhoneChecker {
  static bool isNotValid(String phone) {
    return !RegExp(r"^01[0125][0-9]{8}$").hasMatch(phone);
  }
}

final Appheight = MediaQuery.of(NavigationService.context).size.height;
final Appwidth = MediaQuery.of(NavigationService.context).size.width;
