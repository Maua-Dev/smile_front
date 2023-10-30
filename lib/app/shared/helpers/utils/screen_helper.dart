import 'package:flutter/material.dart';

class Screen {
  static Size size(BuildContext context) => MediaQuery.of(context).size;
  static double width(BuildContext context) => size(context).width;
  static double height(BuildContext context) => size(context).height;
  static double breakpointMobile = 600;
  static double breakpointTablet = 1000;
}
