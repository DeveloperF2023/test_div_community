import 'package:dartz/dartz.dart';
import 'package:test_div_community/features/domain/entities/students/student_entity.dart';
import 'package:test_div_community/features/domain/repository/student_repository.dart';

import '../../../../core/error/failure.dart';

class FetchDetailStudentByIdUseCase {
  final StudentRepository repository;

  FetchDetailStudentByIdUseCase({required this.repository});

  Future<Either<Failure, StudentEntity>> callback(int studentId) {
    return repository.getDetailStudent(studentId);
  }
}
