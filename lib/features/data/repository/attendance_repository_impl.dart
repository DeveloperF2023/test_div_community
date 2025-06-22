import 'package:dartz/dartz.dart';
import 'package:test_div_community/core/error/failure.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_by_date_entity.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_created_reponse_entity.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_status_count_entity.dart';

import '../../domain/repository/attendance_repository.dart';
import '../data_sources/attendance/attendance_remote_data_source_impl.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDataSourceImpl attendanceRemoteDataSourceImpl;

  AttendanceRepositoryImpl({required this.attendanceRemoteDataSourceImpl});

  @override
  Future<Either<Failure, AttendanceCreatedResponseEntity>>
  createAttendanceForMultipleStudents(
    DateTime date,
    List<Map<String, dynamic>> records,
  ) async {
    try {
      final result = await attendanceRemoteDataSourceImpl.createAttendance(
        date,
        records,
      );
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<AttendanceByDateEntity>>> getAttendanceByDate(
    DateTime date,
  ) async {
    try {
      final result = await attendanceRemoteDataSourceImpl.getAttendanceByDate(
        date,
      );
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, AttendanceStatusCountEntity>> getCountOfStatus(
    DateTime date,
  ) async {
    try {
      final result = await attendanceRemoteDataSourceImpl
          .getAttendanceStatusCount(date);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, AttendanceStatusCountEntity>>
  getCountOfStatusOfStudent(int studentId) async {
    try {
      final result = await attendanceRemoteDataSourceImpl
          .getAttendanceStatusCountOfStudent(studentId);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }
}
