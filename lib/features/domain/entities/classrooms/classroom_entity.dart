import 'package:equatable/equatable.dart';

class ClassroomEntity extends Equatable {
  final int? id;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  const ClassroomEntity({this.id, this.name, this.createdAt, this.updatedAt});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, createdAt, updatedAt];
}
