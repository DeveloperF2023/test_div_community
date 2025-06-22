import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final int? id;
  final String? title;
  final String? body;
  final String? type;

  const NotificationEntity({this.id, this.title, this.body, this.type});

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, body, type];
}
