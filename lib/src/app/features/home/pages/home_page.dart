import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heodat/core/base_bloc/base.dart';
import 'package:heodat/core/config/my_theme.dart';
import 'package:heodat/core/widgets/my_page.dart';
import 'package:heodat/core/widgets/my_text.dart';
import 'package:heodat/src/app/widgets/dark_mode_button.dart';
import 'package:heodat/src/app/widgets/loading_page.dart';
import 'package:heodat/src/app/widgets/pie_progress_bar.dart';
import 'package:heodat/src/app/widgets/smooth_scroll.dart';
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
  ScrollController scrollController = ScrollController();

  @override
  Widget body(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return state is DataLoadedState
              ? SmoothScroll(
                  scrollController: scrollController,
                  child: Padding(
                    padding: EdgeInsets.all(0.05.sw),
                    child: SpacingColumn(
                      spacing: 0.02.sh,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome, v1.6',
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
                          children: List.generate(12, (index) {
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
                                    children: [
                                      PieProgressBar(
                                        size: 70.sp,
                                        progress: 60,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(
                                            'Car',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          MyText(
                                            '60%',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      const MyText('100000 VND'),
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
