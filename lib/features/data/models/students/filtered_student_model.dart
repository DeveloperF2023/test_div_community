import 'package:test_div_community/features/data/models/classrooms/classroom_model.dart';
import 'package:test_div_community/features/domain/entities/students/filtered_student_entity.dart';

class FilteredStudentModel extends FilteredStudentEntity {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? profilePicture;
  final int? classroomId;
  final String? gender;
  final String? birthDate;
  final String? cne;
  final String? level;
  final String? section;
  final String? city;
  final String? createdAt;
  final String? updatedAt;
  final ClassroomModel? classroom;

  const FilteredStudentModel({
    this.id,
    this.firstName,
    this.lastName,
    this.profilePicture,
    this.classroomId,
    this.gender,
    this.birthDate,
    this.cne,
    this.level,
    this.section,
    this.city,
    this.createdAt,
    this.updatedAt,
    this.classroom,
  });

  factory FilteredStudentModel.fromJson(Map<String, dynamic> json) {
    return FilteredStudentModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      profilePicture: json['profile_picture'],
      classroomId: json['classroom_id'],
      gender: json['gender'],
      birthDate: json['birth_date'],
      cne: json['cne'],
      level: json['level'],
      section: json['section'],
      city: json['city'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      classroom: json['classroom'] != null
          ? ClassroomModel.fromJson(json['classroom'])
          : null,
    );
  }
  static List<FilteredStudentModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => FilteredStudentModel.fromJson(json)).toList();
  }
}
