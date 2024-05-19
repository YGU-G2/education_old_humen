import 'package:flutter/material.dart';

class Users {
  String? userFirstName;
  String? userLastName;
  String? userName;
  String? email;
  String? password;
  DateTime? userDate;
  String? gender;
  String? travelCompanion;
  String? healthAndSafety;
  bool? needStroller;

  Users({
    required this.userFirstName,
    required this.userLastName,
    required this.userName,
    required this.email,
    required this.password,
    required this.userDate,
    required this.gender,
    required this.travelCompanion,
    required this.healthAndSafety,
    required this.needStroller,
  });
}