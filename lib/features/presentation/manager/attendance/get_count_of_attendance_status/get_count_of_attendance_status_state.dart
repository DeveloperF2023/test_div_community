part of 'get_count_of_attendance_status_cubit.dart';

sealed class GetCountOfAttendanceStatusState extends Equatable {
  const GetCountOfAttendanceStatusState();
}

final class GetCountOfAttendanceStatusInitial
    extends GetCountOfAttendanceStatusState {
  @override
  List<Object> get props => [];
}

final class GetCountOfAttendanceStatusLoading
    extends GetCountOfAttendanceStatusState {
  @override
  List<Object> get props => [];
}

final class GetCountOfAttendanceStatusLoaded
    extends GetCountOfAttendanceStatusState {
  final AttendanceStatusCountEntity attendanceStatusCount;

  GetCountOfAttendanceStatusLoaded({required this.attendanceStatusCount});
  @override
  List<Object> get props => [attendanceStatusCount];
}

final class GetCountOfAttendanceStatusFailure
    extends GetCountOfAttendanceStatusState {
  final String message;

  GetCountOfAttendanceStatusFailure({required this.message});
  @override
  List<Object> get props => [message];
}
