class AttendanceModel {
  int? studentId;
  String? date;
  String? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  AttendanceModel({
    this.studentId,
    this.date,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    date = json['date'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}
