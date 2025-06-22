import 'package:dartz/dartz.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_status_count_entity.dart';
import 'package:test_div_community/features/domain/repository/attendance_repository.dart';

import '../../../../core/error/failure.dart';

class FetchCountOfAttendanceStatusOfStudentUseCase {
  final AttendanceRepository repository;

  FetchCountOfAttendanceStatusOfStudentUseCase({required this.repository});

  Future<Either<Failure, AttendanceStatusCountEntity>> callback(int studentId) {
    return repository.getCountOfStatusOfStudent(studentId);
  }
}
