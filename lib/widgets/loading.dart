import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled2/utils/constants.dart';

class Loading {
  static const Widget fadingCube = SpinKitFadingCube(
    color: Constants.primaryColor,
    size: 40.0,
  );
  static const Widget circle = SpinKitCircle(
    color: Constants.primaryColor,
    size: 40.0,
  );
}
