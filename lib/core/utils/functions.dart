import 'package:flutter/material.dart';
import 'package:heodat/core/config/app_config.dart';

disableFocus(BuildContext context) async {
  if (AppConfig.instance(context)?.overlayEntry.mounted ?? false) {
    AppConfig.instance(context)?.overlayEntry.remove();
  }
}
