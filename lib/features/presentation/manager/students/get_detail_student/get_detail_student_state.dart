part of 'get_detail_student_cubit.dart';

sealed class GetDetailStudentState extends Equatable {
  const GetDetailStudentState();
}

final class GetDetailStudentInitial extends GetDetailStudentState {
  @override
  List<Object> get props => [];
}

final class GetDetailStudentLoading extends GetDetailStudentState {
  @override
  List<Object> get props => [];
}

final class GetDetailStudentLoaded extends GetDetailStudentState {
  final StudentEntity student;

  GetDetailStudentLoaded({required this.student});
  @override
  List<Object> get props => [student];
}

final class GetDetailStudentFailure extends GetDetailStudentState {
  final String message;

  GetDetailStudentFailure({required this.message});
  @override
  List<Object> get props => [message];
}
