import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_status_count_entity.dart';
import 'package:test_div_community/features/domain/use_case/attendance/fetch_status_count_attendance_of_student_use_case.dart';

part 'get_count_of_attendance_for_student_state.dart';

class GetCountOfAttendanceForStudentCubit
    extends Cubit<GetCountOfAttendanceForStudentState> {
  final FetchCountOfAttendanceStatusOfStudentUseCase
  fetchCountOfAttendanceStatusOfStudentUseCase;
  GetCountOfAttendanceForStudentCubit({
    required this.fetchCountOfAttendanceStatusOfStudentUseCase,
  }) : super(GetCountOfAttendanceForStudentInitial());

  Future<void> getCountOfAttendanceOfStudentId({required int studentId}) async {
    emit(GetCountOfAttendanceForStudentLoading());
    try {
      final result = await fetchCountOfAttendanceStatusOfStudentUseCase
          .callback(studentId);
      result.fold(
        (l) => emit(GetCountOfAttendanceForStudentFailure(message: l.message)),
        (r) =>
            emit(GetCountOfAttendanceForStudentLoaded(attendanceOfStudent: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetCountOfAttendanceForStudentFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetCountOfAttendanceForStudentFailure(message: e.toString()));
    }
  }
}
