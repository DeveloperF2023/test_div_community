import 'package:test_div_community/features/data/models/notification/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getAllNotifications();
}
