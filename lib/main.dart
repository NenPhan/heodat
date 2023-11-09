import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heodat/app.dart';
import 'package:heodat/app_config.dart';
import 'package:heodat/core/utils/enums.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDNjDPjFdJCWG55twiWj_gKtha22V0skFU',
    appId: "1:872884573772:web:857cd7fe23307167d1c6e9",
    messagingSenderId: '872884573772',
    projectId: 'heodat-36d04',
  ));
  runApp(
    AppConfig(
      appName: 'Heo dat',
      flavorName: AppFlavor.DEVELOPMENT,
      socket: '',
      resource: '',
      resourceIcon: '',
      apiUrl: '',
      host: '',
      logResponse: false,
      child: const MyApp(),
    ),
  );
}
