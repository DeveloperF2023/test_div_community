import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_by_date_entity.dart';
import 'package:test_div_community/features/domain/use_case/attendance/fetch_attendance_by_date_use_case.dart';

part 'get_attendance_by_date_state.dart';

class GetAttendanceByDateCubit extends Cubit<GetAttendanceByDateState> {
  final FetchAttendanceByDateUseCase fetchAttendanceByDateUseCase;
  GetAttendanceByDateCubit({required this.fetchAttendanceByDateUseCase})
    : super(GetAttendanceByDateInitial());

  Future<void> getAttendanceByDate({required DateTime date}) async {
    emit(GetAttendanceByDateLoading());
    try {
      final result = await fetchAttendanceByDateUseCase.callback(date);
      result.fold(
        (l) => emit(GetAttendanceByDateFailure(message: l.message)),
        (r) => emit(GetAttendanceByDateLoaded(attendanceByDate: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetAttendanceByDateFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetAttendanceByDateFailure(message: e.toString()));
    }
  }
}
