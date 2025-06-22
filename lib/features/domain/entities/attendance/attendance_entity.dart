import 'package:equatable/equatable.dart';

class AttendanceEntity extends Equatable {
  final int? studentId;
  final String? date;
  final String? status;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  const AttendanceEntity({
    this.studentId,
    this.date,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    studentId,
    date,
    status,
    updatedAt,
    createdAt,
    id,
  ];
}
