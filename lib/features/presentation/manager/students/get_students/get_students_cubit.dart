import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_div_community/features/domain/entities/students/student_entity.dart';
import 'package:test_div_community/features/domain/use_case/students/fetch_students_use_case.dart';

part 'get_students_state.dart';

class GetStudentsCubit extends Cubit<GetStudentsState> {
  final FetchStudentsUseCase fetchStudentsUseCase;
  GetStudentsCubit({required this.fetchStudentsUseCase})
    : super(GetStudentsInitial());

  Future<void> getStudents() async {
    emit(GetStudentsLoading());
    try {
      final result = await fetchStudentsUseCase.callback();
      result.fold(
        (l) => emit(GetStudentsFailure(message: l.message)),
        (r) => emit(GetStudentsLoaded(students: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetStudentsFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetStudentsFailure(message: e.toString()));
    }
  }
}
