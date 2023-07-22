import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heodat/core/base_bloc/base.dart';
import 'package:heodat/core/utils/classes/heo_color.dart';
import 'package:heodat/core/widgets/sz.dart';
import 'package:heodat/src/app/pages/home/home_page_bloc.dart';
import 'package:heodat/src/data/datasource.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String get route => '/home';

  @override
  State<HomePage> createState() => _HomrPageState();
}

class _HomrPageState extends State<HomePage> {
  HomePageBloc bloc = HomePageBloc();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: HeoColor.bgr,
            body: state is DataLoadedState
                ? Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: scrSize(context).height * 0.01),
                          height: scrSize(context).height * 0.08,
                          color: HeoColor.mainColor2,
                          child: Row(children: [
                            Text(
                              bloc.room.roomName ?? '',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          ]),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
          );
        });
  }
}
