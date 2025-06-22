import 'package:equatable/equatable.dart';
import 'package:test_div_community/features/domain/entities/classrooms/classroom_entity.dart';

class FilteredStudentEntity extends Equatable {
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
  final ClassroomEntity? classroom;

  const FilteredStudentEntity({
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

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    profilePicture,
    classroomId,
    gender,
    birthDate,
    cne,
    level,
    section,
    city,
    createdAt,
    updatedAt,
    classroom,
  ];
}
