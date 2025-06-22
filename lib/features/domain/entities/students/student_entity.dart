import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
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

  StudentEntity({
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

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    profilePicture,
    classroomId,
    classroomName,
    gender,
    birthDate,
    cne,
    level,
    section,
    city,
    phone,
    createdAt,
    updatedAt,
  ];
}
