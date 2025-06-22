import 'package:test_div_community/features/domain/entities/notification/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  int? id;
  String? title;
  String? body;
  String? type;

  NotificationModel({this.id, this.title, this.body, this.type});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    type = json['type'];
  }
  static List<NotificationModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => NotificationModel.fromJson(json)).toList();
  }
}
