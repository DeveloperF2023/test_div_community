part of 'get_filtered_student_cubit.dart';

sealed class GetFilteredStudentState extends Equatable {
  const GetFilteredStudentState();
}

final class GetFilteredStudentInitial extends GetFilteredStudentState {
  @override
  List<Object> get props => [];
}

final class GetFilteredStudentLoading extends GetFilteredStudentState {
  @override
  List<Object> get props => [];
}

final class GetFilteredStudentLoaded extends GetFilteredStudentState {
  final List<FilteredStudentEntity> filteredStudents;

  const GetFilteredStudentLoaded({required this.filteredStudents});
  @override
  List<Object> get props => [filteredStudents];
}

final class GetFilteredStudentFailure extends GetFilteredStudentState {
  final String message;

  GetFilteredStudentFailure({required this.message});
  @override
  List<Object> get props => [message];
}
