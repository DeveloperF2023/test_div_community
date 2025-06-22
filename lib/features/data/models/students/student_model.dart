import 'package:test_div_community/features/domain/entities/students/student_entity.dart';

class StudentModel extends StudentEntity {
  int? id;
  String? firstName;
  String? lastName;
  String? profilePicture;
  int? classroomId;
  String? classroomName;
  String? gender;
  String? birthDate;
  String? cne;
  String? level;
  String? section;
  String? city;
  String? phone;
  String? createdAt;
  String? updatedAt;

  StudentModel({
    this.id,
    this.firstName,
    this.lastName,
    this.profilePicture,
    this.classroomId,
    this.classroomName,
    this.gender,
    this.birthDate,
    this.cne,
    this.level,
    this.section,
    this.city,
    this.phone,
    this.createdAt,
    this.updatedAt,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      profilePicture: json['profile_picture'],
      classroomId: json['classroom_id'],
      classroomName: json['classroom_name'],
      gender: json['gender'],
      birthDate: json['birth_date'],
      cne: json['cne'],
      level: json['level'],
      section: json['section'],
      city: json['city'],
      phone: json['phone'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  static List<StudentModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => StudentModel.fromJson(json)).toList();
  }
}
