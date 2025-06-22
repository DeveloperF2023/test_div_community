part of 'create_multiple_attendance_cubit.dart';

sealed class CreateMultipleAttendanceState extends Equatable {
  const CreateMultipleAttendanceState();
}

final class CreateMultipleAttendanceInitial
    extends CreateMultipleAttendanceState {
  @override
  List<Object> get props => [];
}

final class CreateMultipleAttendanceLoading
    extends CreateMultipleAttendanceState {
  @override
  List<Object> get props => [];
}

final class CreateMultipleAttendanceLoaded
    extends CreateMultipleAttendanceState {
  final AttendanceCreatedResponseEntity attendanceCreated;

  const CreateMultipleAttendanceLoaded({required this.attendanceCreated});
  @override
  List<Object> get props => [attendanceCreated];
}

final class CreateMultipleAttendanceFailure
    extends CreateMultipleAttendanceState {
  final String message;

  const CreateMultipleAttendanceFailure({required this.message});
  @override
  List<Object> get props => [message];
}
