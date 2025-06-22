import 'package:test_div_community/features/data/models/attendance/attendance_by_date_model.dart';
import 'package:test_div_community/features/data/models/attendance/attendance_count_status_model.dart';
import 'package:test_div_community/features/data/models/attendance/attendance_created_response_model.dart';

abstract class AttendanceRemoteDataSource {
  Future<AttendanceCreatedResponseModel> createAttendance(
    DateTime date,
    List<Map<String, dynamic>> records,
  );
  Future<List<AttendanceByDateModel>> getAttendanceByDate(DateTime date);
  Future<AttendanceStatusCountModel> getAttendanceStatusCount(DateTime date);
  Future<AttendanceStatusCountModel> getAttendanceStatusCountOfStudent(
    int studentId,
  );
}
