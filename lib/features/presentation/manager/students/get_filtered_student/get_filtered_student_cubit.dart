import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_div_community/features/domain/entities/students/filtered_student_entity.dart';
import 'package:test_div_community/features/domain/use_case/students/fetch_filtered_students_use_case.dart';

part 'get_filtered_student_state.dart';

class GetFilteredStudentCubit extends Cubit<GetFilteredStudentState> {
  final FetchFilteredStudentsUseCase fetchFilteredStudentsUseCase;
  GetFilteredStudentCubit({required this.fetchFilteredStudentsUseCase})
    : super(GetFilteredStudentInitial());

  Future<void> getStudents({required String gender}) async {
    emit(GetFilteredStudentLoading());
    try {
      final result = await fetchFilteredStudentsUseCase.callback(gender);
      result.fold(
        (l) => emit(GetFilteredStudentFailure(message: l.message)),
        (r) => emit(GetFilteredStudentLoaded(filteredStudents: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetFilteredStudentFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetFilteredStudentFailure(message: e.toString()));
    }
  }
}
