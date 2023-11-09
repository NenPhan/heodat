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
import 'package:heodat/src/app/widgets/rounded_container.dart';
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
              ? SingleChildScrollView(
                  controller: scrollController,
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
                                    padding: const EdgeInsets.all(20),
                                    color: theme(context).cardColor,
                                    child: Row(children: [
                                      SpacingColumn(
                                        spacing: 10,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Opacity(
                                              opacity: .8,
                                              child: MyText(
                                                'BALANCE',
                                                style: textTheme(context)
                                                    .bodySmall,
                                              )),
                                          const MyText(
                                            '\$ 999999999999',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        icon: const Icon(Icons.tune_rounded),
                                        onPressed: () {},
                                      )
                                    ]),
                                  ),
                                ),
                              ],
                            )
                          ]),
                        ),
                        RoundedContainer(
                          height: 70,
                          width: 1.sw,
                        ),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: List.generate(12, (index) {
                            return LayoutBuilder(builder: (context, cons) {
                              return Container(
                                  width: (cons.maxWidth - 10) / 2,
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
