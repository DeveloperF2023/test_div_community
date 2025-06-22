import 'package:test_div_community/features/data/models/students/student_model.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_by_date_entity.dart';

class AttendanceByDateModel extends AttendanceByDateEntity {
  final int? id;
  final int? studentId;
  final String? date;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final StudentModel? student;

  AttendanceByDateModel({
    this.id,
    this.studentId,
    this.date,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.student,
  }) : super(student: student);

  factory AttendanceByDateModel.fromJson(Map<String, dynamic> json) {
    return AttendanceByDateModel(
      id: json['id'],
      studentId: json['student_id'],
      date: json['date'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      student: json['student'] != null
          ? StudentModel.fromJson(json['student'])
          : null,
    );
  }

  static List<AttendanceByDateModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => AttendanceByDateModel.fromJson(json))
        .toList();
  }
}
