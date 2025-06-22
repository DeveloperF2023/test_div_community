import 'package:dartz/dartz.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_by_date_entity.dart';
import 'package:test_div_community/features/domain/repository/attendance_repository.dart';

import '../../../../core/error/failure.dart';

class FetchAttendanceByDateUseCase {
  final AttendanceRepository repository;

  FetchAttendanceByDateUseCase({required this.repository});

  Future<Either<Failure, List<AttendanceByDateEntity>>> callback(
    DateTime date,
  ) {
    return repository.getAttendanceByDate(date);
  }
}
