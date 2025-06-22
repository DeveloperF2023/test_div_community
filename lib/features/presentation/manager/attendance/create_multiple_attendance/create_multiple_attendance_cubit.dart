import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_created_reponse_entity.dart';
import 'package:test_div_community/features/domain/use_case/attendance/create_multiple_attendance_use_case.dart';

part 'create_multiple_attendance_state.dart';

class CreateMultipleAttendanceCubit
    extends Cubit<CreateMultipleAttendanceState> {
  final CreateMultipleAttendanceUseCase createMultipleAttendanceUseCase;
  CreateMultipleAttendanceCubit({required this.createMultipleAttendanceUseCase})
    : super(CreateMultipleAttendanceInitial());

  Future<void> createAttendance({
    required DateTime date,
    required List<Map<String, dynamic>> records,
  }) async {
    emit(CreateMultipleAttendanceLoading());
    try {
      final result = await createMultipleAttendanceUseCase.callback(
        date,
        records,
      );
      result.fold(
        (l) => emit(CreateMultipleAttendanceFailure(message: l.message)),
        (r) => emit(CreateMultipleAttendanceLoaded(attendanceCreated: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(CreateMultipleAttendanceFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(CreateMultipleAttendanceFailure(message: e.toString()));
    }
  }
}
