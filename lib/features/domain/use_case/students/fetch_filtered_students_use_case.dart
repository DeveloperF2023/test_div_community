import 'package:dartz/dartz.dart';
import 'package:test_div_community/features/domain/entities/students/filtered_student_entity.dart';
import 'package:test_div_community/features/domain/repository/student_repository.dart';

import '../../../../core/error/failure.dart';

class FetchFilteredStudentsUseCase {
  final StudentRepository repository;

  FetchFilteredStudentsUseCase({required this.repository});

  Future<Either<Failure, List<FilteredStudentEntity>>> callback(String filter) {
    return repository.getFilteredStudents(filter);
  }
}
