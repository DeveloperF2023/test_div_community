import 'package:dartz/dartz.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_created_reponse_entity.dart';
import 'package:test_div_community/features/domain/repository/attendance_repository.dart';

import '../../../../core/error/failure.dart';

class CreateMultipleAttendanceUseCase {
  final AttendanceRepository repository;

  CreateMultipleAttendanceUseCase({required this.repository});

  Future<Either<Failure, AttendanceCreatedResponseEntity>> callback(
    DateTime date,
    List<Map<String, dynamic>> records,
  ) {
    return repository.createAttendanceForMultipleStudents(date, records);
  }
}
