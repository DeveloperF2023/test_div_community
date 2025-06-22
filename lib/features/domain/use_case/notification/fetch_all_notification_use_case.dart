import 'package:dartz/dartz.dart';
import 'package:test_div_community/features/domain/entities/notification/notification_entity.dart';
import 'package:test_div_community/features/domain/repository/notification_repository.dart';

import '../../../../core/error/failure.dart';

class FetchAllNotificationUseCase {
  final NotificationRepository repository;

  FetchAllNotificationUseCase({required this.repository});

  Future<Either<Failure, List<NotificationEntity>>> callback() {
    return repository.getAllNotification();
  }
}
