import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_div_community/core/routes/app_routes.dart';
import 'package:test_div_community/dependencies_injection.dart';
import 'package:test_div_community/features/presentation/manager/students/get_filtered_student/get_filtered_student_cubit.dart';
import 'package:test_div_community/features/presentation/widgets/global/widgets_imports.dart';
import 'package:test_div_community/features/presentation/widgets/student_tile.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/helper_functions.dart';
import '../widgets/global/header_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: HelperFunctions.screenHeight(context) * .1,
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: HeaderApp(
                  isNotificationShown: true,
                  onNotificationTap: () =>
                      Navigator.pushNamed(context, AppRoutes.notifications),
                ),
              ),
              backgroundColor: HelperFunctions.isDarkMode(context)
                  ? AppColors.dark
                  : AppColors.white,
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                decoration: BoxDecoration(
                  color: HelperFunctions.isDarkMode(context)
                      ? AppColors.darkContainer
                      : AppColors.light,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  isScrollable: false,
                  labelPadding: const EdgeInsets.only(left: 5, right: 5),
                  indicator: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  unselectedLabelColor: HelperFunctions.isDarkMode(context)
                      ? AppColors.white
                      : AppColors.black,
                  labelColor: AppColors.white,
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 12),
                  dividerColor: Colors.transparent,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  tabs: [
                    Tab(text: "Female"),
                    Tab(text: "Male"),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: HelperFunctions.screenHeight(context) * .63,
                child: TabBarView(
                  children: [
                    BlocProvider<GetFilteredStudentCubit>(
                      create: (context) =>
                          locator<GetFilteredStudentCubit>()
                            ..getStudents(gender: "female"),
                      child:
                          BlocBuilder<
                            GetFilteredStudentCubit,
                            GetFilteredStudentState
                          >(
                            builder: (context, state) {
                              if (state is GetFilteredStudentLoading) {
                                return CustomLoadingForStudentList();
                              } else if (state is GetFilteredStudentLoaded) {
                                return ListView.builder(
                                  itemCount: state.filteredStudents.length,
                                  padding: EdgeInsets.only(
                                    top: 20,
                                    left: 15,
                                    right: 15,
                                  ),
                                  itemBuilder: (context, index) {
                                    final student =
                                        state.filteredStudents[index];
                                    return StudentTile(student: student);
                                  },
                                );
                              } else if (state is GetFilteredStudentFailure) {
                                return Center(child: Text(state.message));
                              }
                              return Container();
                            },
                          ),
                    ),
                    BlocProvider<GetFilteredStudentCubit>(
                      create: (context) =>
                          locator<GetFilteredStudentCubit>()
                            ..getStudents(gender: "male"),
                      child:
                          BlocBuilder<
                            GetFilteredStudentCubit,
                            GetFilteredStudentState
                          >(
                            builder: (context, state) {
                              if (state is GetFilteredStudentLoading) {
                                return CustomLoadingForStudentList();
                              } else if (state is GetFilteredStudentLoaded) {
                                return ListView.builder(
                                  itemCount: state.filteredStudents.length,
                                  padding: EdgeInsets.only(
                                    top: 20,
                                    left: 15,
                                    right: 15,
                                  ),
                                  itemBuilder: (context, index) {
                                    final student =
                                        state.filteredStudents[index];
                                    return StudentTile(student: student);
                                  },
                                );
                              } else if (state is GetFilteredStudentFailure) {
                                return Center(child: Text(state.message));
                              }
                              return Container();
                            },
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
