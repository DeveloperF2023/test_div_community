import 'package:test_div_community/features/domain/entities/classrooms/classroom_entity.dart';

class ClassroomModel extends ClassroomEntity {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  ClassroomModel({this.id, this.name, this.createdAt, this.updatedAt});

  ClassroomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
