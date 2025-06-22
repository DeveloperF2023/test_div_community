import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_div_community/core/api/endpoints_constants.dart';
import 'package:test_div_community/core/routes/app_routes.dart';
import 'package:test_div_community/dependencies_injection.dart';
import 'package:test_div_community/features/presentation/manager/attendance/create_multiple_attendance/create_multiple_attendance_cubit.dart';
import 'package:test_div_community/features/presentation/manager/students/get_students/get_students_cubit.dart';
import 'package:test_div_community/features/presentation/widgets/global/primary_button.dart';
import 'package:test_div_community/features/presentation/widgets/global/widgets_imports.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/helper_functions.dart';
import '../widgets/attendance/widgets_imports.dart';
import '../widgets/global/customizable_alert_dialog.dart';
import '../widgets/global/header_app.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final Map<int, String> attendanceMap = {};
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetStudentsCubit>(
          create: (context) => locator<GetStudentsCubit>()..getStudents(),
        ),
        BlocProvider<CreateMultipleAttendanceCubit>(
          create: (context) => locator<CreateMultipleAttendanceCubit>(),
        ),
      ],
      child: BlocListener<CreateMultipleAttendanceCubit, CreateMultipleAttendanceState>(
        listener: (context, state) {
          if (state is CreateMultipleAttendanceLoaded) {
            setState(() {
              attendanceMap.clear();
            });
            showDialog(
              context: context,
              builder: (_) => CustomizableAlertDialog(),
            );
          }
        },
        child: Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                BlocBuilder<
                  CreateMultipleAttendanceCubit,
                  CreateMultipleAttendanceState
                >(
                  builder: (context, state) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (state is CreateMultipleAttendanceFailure)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Error: ${state.message}",
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        PrimaryButton(
                          textButton: state is CreateMultipleAttendanceLoading
                              ? "Submitting..."
                              : "Submit Attendance",
                          onTap: () {
                            final List<Map<String, dynamic>> records =
                                attendanceMap.entries.map((e) {
                                  return {
                                    'student_id': e.key,
                                    'status': e.value,
                                  };
                                }).toList();

                            if (records.isEmpty ||
                                records.any((r) => r['status'] == null)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Mark attendance before submitting.",
                                  ),
                                ),
                              );
                              return;
                            }

                            context
                                .read<CreateMultipleAttendanceCubit>()
                                .createAttendance(
                                  date: selectedDate,
                                  records: records,
                                );
                          },
                        ),
                      ],
                    );
                  },
                ),
          ),

          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: HelperFunctions.screenHeight(context) * .1,
                floating: false,
                pinned: true,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: HeaderApp(
                    isNotificationShown: false,
                    onHistoryTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.historyAttendance,
                    ),
                  ),
                ),
                backgroundColor: HelperFunctions.isDarkMode(context)
                    ? AppColors.dark
                    : AppColors.white,
              ),
              SliverPadding(
                padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    BlocBuilder<GetStudentsCubit, GetStudentsState>(
                      builder: (context, state) {
                        if (state is GetStudentsLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is GetStudentsFailure) {
                          return Center(child: Text("Error: ${state.message}"));
                        } else if (state is GetStudentsLoaded) {
                          final students = state.students;

                          return Column(
                            children: [
                              Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(2),
                                  1: FlexColumnWidth(3),
                                },
                                children: [
                                  TableRow(
                                    decoration: BoxDecoration(
                                      color: HelperFunctions.isDarkMode(context)
                                          ? AppColors.darkContainer
                                          : AppColors.lightContainer,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Center(
                                          child: Text(
                                            'Student',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.titleLarge,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Center(
                                          child: Text(
                                            'Attendance',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.titleLarge,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Data Rows
                                  ...students.map((student) {
                                    return TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 18,
                                            left: 10,
                                          ),
                                          child: Row(
                                            children: [
                                              CircleProfilePicture(
                                                imageUrl:
                                                    "${EndpointsConstants.imageUrl}${student.profilePicture!}",
                                                height: 40,
                                                width: 40,
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  "${student.firstName} ${student.lastName}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 25,
                                            top: 20,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              StatusSelector(
                                                studentId: student.id!,
                                                attendanceMap: attendanceMap,
                                                onChanged: (updatedMap) {
                                                  setState(() {
                                                    attendanceMap[student.id!] =
                                                        updatedMap[student
                                                            .id!]!;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return const Center(child: Text("Unexpected state"));
                        }
                      },
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
