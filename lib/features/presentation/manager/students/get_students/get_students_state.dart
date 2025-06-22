part of 'get_students_cubit.dart';

sealed class GetStudentsState extends Equatable {
  const GetStudentsState();
}

final class GetStudentsInitial extends GetStudentsState {
  @override
  List<Object> get props => [];
}

final class GetStudentsLoading extends GetStudentsState {
  @override
  List<Object> get props => [];
}

final class GetStudentsLoaded extends GetStudentsState {
  final List<StudentEntity> students;

  const GetStudentsLoaded({required this.students});
  @override
  List<Object> get props => [students];
}

final class GetStudentsFailure extends GetStudentsState {
  final String message;

  GetStudentsFailure({required this.message});
  @override
  List<Object> get props => [message];
}
