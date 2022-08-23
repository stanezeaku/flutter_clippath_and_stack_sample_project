import 'package:flutter/material.dart';


class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget web;

  const Responsive({
    Key? key,
    required this.mobile,
    
    required this.web,
    
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 780;

  

  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 1134) {
      return web;
    }  else {
      return mobile;
    }
  }
}
