import 'package:dartz/dartz.dart';
import 'package:test_div_community/features/domain/entities/notification/notification_entity.dart';

import '../../../core/error/failure.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationEntity>>> getAllNotification();
}
