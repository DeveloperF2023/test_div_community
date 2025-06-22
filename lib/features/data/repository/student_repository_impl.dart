import 'package:dartz/dartz.dart';
import 'package:test_div_community/core/error/failure.dart';
import 'package:test_div_community/features/data/data_sources/students/student_remote_data_source_impl.dart';
import 'package:test_div_community/features/domain/entities/students/filtered_student_entity.dart';
import 'package:test_div_community/features/domain/entities/students/student_entity.dart';
import 'package:test_div_community/features/domain/repository/student_repository.dart';

class StudentRepositoryImpl extends StudentRepository {
  final StudentRemoteDataSourceImpl studentRemoteDataSource;

  StudentRepositoryImpl({required this.studentRemoteDataSource});
  @override
  Future<Either<Failure, List<StudentEntity>>> getAllStudents() async {
    try {
      final result = await studentRemoteDataSource.getAllStudents();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<FilteredStudentEntity>>> getFilteredStudents(
    String filter,
  ) async {
    try {
      final result = await studentRemoteDataSource.getFilteredStudents(filter);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, StudentEntity>> getDetailStudent(int studentId) async {
    try {
      final result = await studentRemoteDataSource.getDetailOfStudentById(
        studentId,
      );
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }
}
