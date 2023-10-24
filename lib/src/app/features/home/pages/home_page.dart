import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heodat/core/base_bloc/base.dart';
import 'package:heodat/core/config/my_theme.dart';
import 'package:heodat/core/widgets/my_page.dart';
import 'package:heodat/core/widgets/my_text.dart';
import 'package:heodat/core/widgets/sz.dart';
import 'package:heodat/src/app/widgets/dark_mode_button.dart';
import 'package:heodat/src/app/widgets/loading_page.dart';
import 'package:heodat/src/app/widgets/pie_progress_bar.dart';
import 'package:heodat/src/app/widgets/spacing_widget.dart';

import '../blocs/home_page_bloc.dart';

class HomePage extends HeoSfPage {
  const HomePage({super.key});
  static const String route = '/home';

  @override
  HeoSfPageState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HeoSfPageState<HomePage> {
  HomePageBloc bloc = HomePageBloc();

  @override
  Widget body(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return state is DataLoadedState
              ? SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(scrSize(context).width * 0.05),
                    child: SpacingColumn(
                      spacing: scrSize(context).height * 0.02,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome,',
                                  style: textTheme(context)
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Nên!',
                                  style: textTheme(context)
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const ThemeSwitchButton(),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Column(children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 160,
                                    color: Colors.grey.withOpacity(.3),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 90,
                                    color: theme(context).cardColor,
                                  ),
                                ),
                              ],
                            )
                          ]),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                    color: theme(context).cardColor,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: List.generate(6, (index) {
                            return LayoutBuilder(builder: (context, cons) {
                              return Container(
                                  width: cons.maxWidth / 2 - 10,
                                  decoration: BoxDecoration(
                                      color: theme(context).cardColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: const EdgeInsets.all(20),
                                  child: SpacingColumn(
                                    spacing: 10,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      PieProgressBar(progress: 80),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText('Abc'),
                                          MyText('Abc'),
                                        ],
                                      ),
                                      MyText('Abc'),
                                    ],
                                  ));
                            });
                          }),
                        )
                      ],
                    ),
                  ),
                )
              : const LoadingPage();
        });
  }
}
