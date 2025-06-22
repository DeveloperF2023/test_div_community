part of 'get_count_of_attendance_for_student_cubit.dart';

sealed class GetCountOfAttendanceForStudentState extends Equatable {
  const GetCountOfAttendanceForStudentState();
}

final class GetCountOfAttendanceForStudentInitial
    extends GetCountOfAttendanceForStudentState {
  @override
  List<Object> get props => [];
}

final class GetCountOfAttendanceForStudentLoading
    extends GetCountOfAttendanceForStudentState {
  @override
  List<Object> get props => [];
}

final class GetCountOfAttendanceForStudentLoaded
    extends GetCountOfAttendanceForStudentState {
  final AttendanceStatusCountEntity attendanceOfStudent;

  const GetCountOfAttendanceForStudentLoaded({
    required this.attendanceOfStudent,
  });
  @override
  List<Object> get props => [attendanceOfStudent];
}

final class GetCountOfAttendanceForStudentFailure
    extends GetCountOfAttendanceForStudentState {
  final String message;

  const GetCountOfAttendanceForStudentFailure({required this.message});
  @override
  List<Object> get props => [message];
}
