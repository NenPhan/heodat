import 'package:flutter/material.dart';
import 'package:heodat/core/widgets/sz.dart';

abstract class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    initPage(context);
    return Scaffold(body: SafeArea(child: child(context) ?? sz()));
  }

  Widget? child(BuildContext context) {
    return sz();
  }

  initPage(BuildContext context) {}

  String get route => '/';
}
