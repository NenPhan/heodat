import 'package:flutter/material.dart';
import 'package:heodat/core/widgets/sz.dart';
import 'package:heodat/src/app/widgets/loading_page.dart';

abstract class HeoSlPage extends StatelessWidget {
  const HeoSlPage({super.key});

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

abstract class HeoSfPage extends StatefulWidget {
  const HeoSfPage({super.key});
}

abstract class HeoSfPageState<Page extends HeoSfPage> extends State<HeoSfPage> {
  bool loading = false;
  Color? get backgroundColor => null;

  bool? resizeToAvoidBottomInset({bool? value}) => true;

  Widget? appBar(BuildContext context) => null;

  Widget? overlayWidget(BuildContext context) {
    return const SizedBox();
  }

  Widget body(BuildContext context);

  setLoading(bool value) {
    loading = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var bgrColor = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
      backgroundColor: backgroundColor ?? bgrColor,
      body: SafeArea(
        child: Column(
          children: [
            if (appBar(context) != null) appBar(context)!,
            Expanded(
              child: Stack(
                children: [
                  body(context),
                  if (loading) const LoadingPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
