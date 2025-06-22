import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_div_community/dependencies_injection.dart';
import 'package:test_div_community/features/presentation/manager/students/get_detail_student/get_detail_student_cubit.dart';

import '../widgets/students/widgets_imports.dart';

class DetailStudentScreen extends StatelessWidget {
  final int studentId;

  const DetailStudentScreen({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<GetDetailStudentCubit>(
        create: (context) =>
            locator<GetDetailStudentCubit>()..getStudents(studentId: studentId),
        child: BlocBuilder<GetDetailStudentCubit, GetDetailStudentState>(
          builder: (context, state) {
            if (state is GetDetailStudentLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetDetailStudentLoaded) {
              return DetailStudentItem(student: state.student);
            } else if (state is GetDetailStudentFailure) {
              return Center(child: Text("Error : ${state.message}"));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
