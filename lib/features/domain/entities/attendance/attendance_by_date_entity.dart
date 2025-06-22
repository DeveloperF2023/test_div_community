import 'package:equatable/equatable.dart';
import 'package:test_div_community/features/domain/entities/students/student_entity.dart';

class AttendanceByDateEntity extends Equatable {
  int? id;
  int? studentId;
  String? date;
  String? status;
  String? createdAt;
  String? updatedAt;
  StudentEntity? student;

  AttendanceByDateEntity({
    this.id,
    this.studentId,
    this.date,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.student,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    studentId,
    date,
    status,
    createdAt,
    updatedAt,
    student,
  ];
}
