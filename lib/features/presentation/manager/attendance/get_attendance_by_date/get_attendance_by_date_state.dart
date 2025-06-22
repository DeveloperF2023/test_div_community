part of 'get_attendance_by_date_cubit.dart';

sealed class GetAttendanceByDateState extends Equatable {
  const GetAttendanceByDateState();
}

final class GetAttendanceByDateInitial extends GetAttendanceByDateState {
  @override
  List<Object> get props => [];
}

final class GetAttendanceByDateLoading extends GetAttendanceByDateState {
  @override
  List<Object> get props => [];
}

final class GetAttendanceByDateLoaded extends GetAttendanceByDateState {
  final List<AttendanceByDateEntity> attendanceByDate;

  GetAttendanceByDateLoaded({required this.attendanceByDate});
  @override
  List<Object> get props => [attendanceByDate];
}

final class GetAttendanceByDateFailure extends GetAttendanceByDateState {
  final String message;

  GetAttendanceByDateFailure({required this.message});
  @override
  List<Object> get props => [message];
}
