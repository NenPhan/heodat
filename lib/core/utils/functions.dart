import 'package:flutter/material.dart';
import 'package:heodat/app_config.dart';

disableFocus(BuildContext context) async {
  if (AppConfig.instance?.overlayEntry.mounted ?? false) {
    AppConfig.instance?.overlayEntry.remove();
  }
}
