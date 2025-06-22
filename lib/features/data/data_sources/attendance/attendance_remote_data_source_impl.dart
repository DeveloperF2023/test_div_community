import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:test_div_community/core/api/api_helper.dart';
import 'package:test_div_community/features/data/models/attendance/attendance_by_date_model.dart';
import 'package:test_div_community/features/data/models/attendance/attendance_count_status_model.dart';
import 'package:test_div_community/features/data/models/attendance/attendance_created_response_model.dart';

import '../../../../core/api/endpoints_constants.dart';
import 'attendance_remote_data_source.dart';

class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  final ApiHelper apiHelper;

  AttendanceRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<AttendanceCreatedResponseModel> createAttendance(
    DateTime date,
    List<Map<String, dynamic>> records,
  ) async {
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
    final response = await apiHelper.postRequest(
      endpoint: "${EndpointsConstants.baseUrl}attendance/students",
      data: {"date": formattedDate, "records": records},
    );
    print("Sending attendance:");
    print(jsonEncode({"date": date.toIso8601String(), "records": records}));
    return AttendanceCreatedResponseModel.fromJson(response.data);
  }

  @override
  Future<List<AttendanceByDateModel>> getAttendanceByDate(DateTime date) async {
    final response = await apiHelper.getRequest(
      endpoint: "${EndpointsConstants.baseUrl}attendances/date/$date",
    );
    return AttendanceByDateModel.fromJsonList(response.data);
  }

  @override
  Future<AttendanceStatusCountModel> getAttendanceStatusCount(
    DateTime date,
  ) async {
    final response = await apiHelper.getRequest(
      endpoint: "${EndpointsConstants.baseUrl}attendances/count/$date",
    );
    return AttendanceStatusCountModel.fromJson(response.data);
  }

  @override
  Future<AttendanceStatusCountModel> getAttendanceStatusCountOfStudent(
    int studentId,
  ) async {
    final response = await apiHelper.getRequest(
      endpoint:
          "${EndpointsConstants.baseUrl}attendances/status/monthly/student/$studentId",
    );
    return AttendanceStatusCountModel.fromJson(response.data);
  }
}
