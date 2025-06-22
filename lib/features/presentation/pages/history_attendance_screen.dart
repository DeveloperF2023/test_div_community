import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:test_div_community/core/routes/app_routes.dart';
import 'package:test_div_community/features/presentation/manager/attendance/get_attendance_by_date/get_attendance_by_date_cubit.dart';
import 'package:test_div_community/features/presentation/manager/attendance/get_count_of_attendance_status/get_count_of_attendance_status_cubit.dart';
import 'package:test_div_community/features/presentation/widgets/global/widgets_imports.dart';

import '../../../core/api/endpoints_constants.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/generate_pdf_file.dart';
import '../../../core/utils/helper_functions.dart';
import '../widgets/attendance/widgets_imports.dart';

class HistoryAttendanceScreen extends StatefulWidget {
  const HistoryAttendanceScreen({super.key});

  @override
  State<HistoryAttendanceScreen> createState() =>
      _HistoryAttendanceScreenState();
}

class _HistoryAttendanceScreenState extends State<HistoryAttendanceScreen> {
  final DateTime today = DateTime.now();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetAttendanceByDateCubit>().getAttendanceByDate(date: today);
      context
          .read<GetCountOfAttendanceStatusCubit>()
          .getCountOfAttendanceByDate(date: today);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HelperFunctions.isDarkMode(context)
          ? AppColors.darkContainer
          : AppColors.lightContainer,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: HelperFunctions.screenHeight(context) * .29,
            floating: false,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: HeaderHistoryAttendance(
                isNotificationShown: true,
                onNotificationTap: () =>
                    Navigator.pushNamed(context, AppRoutes.notifications),
              ),
            ),
            backgroundColor: HelperFunctions.isDarkMode(context)
                ? AppColors.dark
                : AppColors.white,
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 5, bottom: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                BlocBuilder<
                  GetCountOfAttendanceStatusCubit,
                  GetCountOfAttendanceStatusState
                >(
                  builder: (context, state) {
                    if (state is GetCountOfAttendanceStatusLoading) {
                      return LoadingCountStatusAttendance();
                    } else if (state is GetCountOfAttendanceStatusLoaded) {
                      return CountStatusAttendance(
                        statusCount: state.attendanceStatusCount,
                        backgroundColor: HelperFunctions.isDarkMode(context)
                            ? AppColors.dark
                            : AppColors.white,
                      );
                    } else if (state is GetCountOfAttendanceStatusFailure) {
                      return Center(child: Text(state.message));
                    }
                    return Center(
                      child: Text("Select a day to view attendance"),
                    );
                  },
                ),
                BlocBuilder<GetAttendanceByDateCubit, GetAttendanceByDateState>(
                  builder: (context, state) {
                    print("Status history $state");

                    if (state is GetAttendanceByDateLoading) {
                      return LoadingHistoryAttendance();
                    } else if (state is GetAttendanceByDateLoaded) {
                      if (state.attendanceByDate.isEmpty) {
                        return Container();
                      }
                      return Container(
                        margin: EdgeInsetsGeometry.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    generateAttendancePdf(
                                      state.attendanceByDate,
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsetsGeometry.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Iconify(
                                          Mdi.export_variant,
                                          size: 15,
                                          color: AppColors.white,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Export as PDF",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(color: AppColors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            DataTable(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              headingRowColor: WidgetStateProperty.all(
                                AppColors.primaryColor.withValues(alpha: 0.3),
                              ), // Header row color
                              dataTextStyle: Theme.of(
                                context,
                              ).textTheme.titleLarge,
                              headingTextStyle: Theme.of(
                                context,
                              ).textTheme.titleLarge,
                              columns: const [
                                DataColumn(
                                  label: Center(child: Text('Student')),
                                ),
                                DataColumn(
                                  label: Center(child: Text('Gender')),
                                ),
                                DataColumn(
                                  label: Center(child: Text('Status')),
                                ),
                              ],
                              rows: state.attendanceByDate.map((attendance) {
                                final student = attendance.student!;
                                return DataRow(
                                  color: WidgetStateProperty.all(
                                    HelperFunctions.isDarkMode(context)
                                        ? AppColors.darkContainer
                                        : AppColors.lightContainer,
                                  ),
                                  cells: [
                                    DataCell(
                                      Row(
                                        children: [
                                          CircleProfilePicture(
                                            imageUrl:
                                                "${EndpointsConstants.imageUrl}${student.profilePicture}",
                                            height: 30,
                                            width: 30,
                                          ),
                                          SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              '${student.firstName} ${student.lastName}',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    DataCell(Text(attendance.student!.gender!)),
                                    DataCell(
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          attendance.status == "present"
                                              ? Iconify(
                                                  Ph.user_duotone,
                                                  color: AppColors.success,
                                                )
                                              : attendance.status == "absent"
                                              ? Iconify(
                                                  Ic.outline_highlight_off,
                                                  color: AppColors.error,
                                                )
                                              : Iconify(
                                                  Ic.baseline_access_alarm,
                                                  color: AppColors.warning,
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      );
                    } else if (state is GetAttendanceByDateFailure) {
                      return Center(child: Text(state.message));
                    }
                    return Center(
                      child: Text("Select a day to view attendance"),
                    );
                  },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
