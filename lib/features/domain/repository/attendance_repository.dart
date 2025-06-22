import 'package:dartz/dartz.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_by_date_entity.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_created_reponse_entity.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_status_count_entity.dart';

import '../../../core/error/failure.dart';

abstract class AttendanceRepository {
  Future<Either<Failure, AttendanceCreatedResponseEntity>>
  createAttendanceForMultipleStudents(
    DateTime date,
    List<Map<String, dynamic>> records,
  );
  Future<Either<Failure, List<AttendanceByDateEntity>>> getAttendanceByDate(
    DateTime date,
  );
  Future<Either<Failure, AttendanceStatusCountEntity>> getCountOfStatus(
    DateTime date,
  );
  Future<Either<Failure, AttendanceStatusCountEntity>>
  getCountOfStatusOfStudent(int studentId);
}
