import 'package:test_div_community/features/data/models/attendance/attendance_model.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_created_reponse_entity.dart';

class AttendanceCreatedResponseModel extends AttendanceCreatedResponseEntity {
  String? message;
  List<AttendanceModel>? data;

  AttendanceCreatedResponseModel({this.message, this.data});

  AttendanceCreatedResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <AttendanceModel>[];
      json['data'].forEach((v) {
        data!.add(AttendanceModel.fromJson(v));
      });
    }
  }
}
