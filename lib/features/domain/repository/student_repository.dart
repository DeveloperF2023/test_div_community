import 'package:dartz/dartz.dart';
import 'package:test_div_community/core/error/failure.dart';
import 'package:test_div_community/features/domain/entities/students/filtered_student_entity.dart';
import 'package:test_div_community/features/domain/entities/students/student_entity.dart';

abstract class StudentRepository {
  Future<Either<Failure, List<StudentEntity>>> getAllStudents();
  Future<Either<Failure, List<FilteredStudentEntity>>> getFilteredStudents(
    String gender,
  );
  Future<Either<Failure, StudentEntity>> getDetailStudent(int studentId);
}
