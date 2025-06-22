import 'package:equatable/equatable.dart';

class AttendanceStatusCountEntity extends Equatable {
  String? present;
  String? absent;
  String? late;

  AttendanceStatusCountEntity({this.present, this.absent, this.late});

  @override
  // TODO: implement props
  List<Object?> get props => [present, absent, late];
}
