import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_status_count_entity.dart';
import 'package:test_div_community/features/domain/use_case/attendance/fetch_count_of_status_by_date_use_case.dart';

part 'get_count_of_attendance_status_state.dart';

class GetCountOfAttendanceStatusCubit
    extends Cubit<GetCountOfAttendanceStatusState> {
  final FetchCountOfAttendanceStatusByDateUseCase
  fetchCountOfAttendanceStatusByDateUseCase;
  GetCountOfAttendanceStatusCubit({
    required this.fetchCountOfAttendanceStatusByDateUseCase,
  }) : super(GetCountOfAttendanceStatusInitial());

  Future<void> getCountOfAttendanceByDate({required DateTime date}) async {
    emit(GetCountOfAttendanceStatusLoading());
    try {
      final result = await fetchCountOfAttendanceStatusByDateUseCase.callback(
        date,
      );
      result.fold(
        (l) => emit(GetCountOfAttendanceStatusFailure(message: l.message)),
        (r) => emit(GetCountOfAttendanceStatusLoaded(attendanceStatusCount: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetCountOfAttendanceStatusFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetCountOfAttendanceStatusFailure(message: e.toString()));
    }
  }
}
