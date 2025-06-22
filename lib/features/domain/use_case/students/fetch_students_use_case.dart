import 'package:dartz/dartz.dart';
import 'package:test_div_community/features/domain/entities/students/student_entity.dart';
import 'package:test_div_community/features/domain/repository/student_repository.dart';

import '../../../../core/error/failure.dart';

class FetchStudentsUseCase {
  final StudentRepository repository;

  FetchStudentsUseCase({required this.repository});

  Future<Either<Failure, List<StudentEntity>>> callback() {
    return repository.getAllStudents();
  }
}
