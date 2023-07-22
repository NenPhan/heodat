import 'package:flutter/material.dart';

class Nav {
  static pushNamed(BuildContext context, String route, {dynamic arguments, dynamic result}) {
    Navigator.pushNamed(context, route, arguments: arguments);
  }

  static popAndPushNamed(BuildContext context, String route, {dynamic arguments, dynamic result}) {
    Navigator.popAndPushNamed(context, route, arguments: arguments, result: result);
  }

  static pop(BuildContext context, [dynamic result]) {
    Navigator.pop(context, result);
  }

  static arguments(context) {
    return ModalRoute.of(context)?.settings.arguments;
  }
}
