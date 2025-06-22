import 'package:equatable/equatable.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_entity.dart';

class AttendanceCreatedResponseEntity extends Equatable {
  final String? message;
  final List<AttendanceEntity>? attendance;

  const AttendanceCreatedResponseEntity({this.message, this.attendance});

  @override
  // TODO: implement props
  List<Object?> get props => [message, attendance];
}
