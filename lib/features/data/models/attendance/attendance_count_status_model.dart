import 'package:test_div_community/features/domain/entities/attendance/attendance_status_count_entity.dart';

class AttendanceStatusCountModel extends AttendanceStatusCountEntity {
  String? present;
  String? absent;
  String? late;

  AttendanceStatusCountModel({this.present, this.absent, this.late});

  AttendanceStatusCountModel.fromJson(Map<String, dynamic> json) {
    present = json['present'];
    absent = json['absent'];
    late = json['late'];
  }
}
