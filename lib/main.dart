import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:heodat/app.dart';
import 'package:heodat/app_config.dart';
import 'package:heodat/core/utils/enums.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDNjDPjFdJCWG55twiWj_gKtha22V0skFU',
    appId: "1:872884573772:web:857cd7fe23307167d1c6e9",
    messagingSenderId: '872884573772',
    projectId: 'heodat-36d04',
  ));
  runApp(
    AppConfig(
      socket: 'https://evinote-api.gonosen.work/',
      resource: 'https://evinote-api.gonosen.work/files/',
      resourceIcon: 'https://evinote-admin.gonosen.work/storage/',
      appName: 'Evinote Development',
      flavorName: AppFlavor.DEVELOPMENT,
      apiUrl: 'https://evinote-api.gonosen.work',
      host: 'https://evinote.gonosen.work',
      logResponse: false,
      child: const MyApp(),
    ),
  );
}
