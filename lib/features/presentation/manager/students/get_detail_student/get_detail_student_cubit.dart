import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_div_community/features/domain/entities/students/student_entity.dart';
import 'package:test_div_community/features/domain/use_case/students/fetch_detail_student_id_use_case.dart';

part 'get_detail_student_state.dart';

class GetDetailStudentCubit extends Cubit<GetDetailStudentState> {
  final FetchDetailStudentByIdUseCase fetchDetailStudentByIdUseCase;
  GetDetailStudentCubit({required this.fetchDetailStudentByIdUseCase})
    : super(GetDetailStudentInitial());
  Future<void> getStudents({required int studentId}) async {
    emit(GetDetailStudentLoading());
    try {
      final result = await fetchDetailStudentByIdUseCase.callback(studentId);
      result.fold(
        (l) => emit(GetDetailStudentFailure(message: l.message)),
        (r) => emit(GetDetailStudentLoaded(student: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetDetailStudentFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetDetailStudentFailure(message: e.toString()));
    }
  }
}
