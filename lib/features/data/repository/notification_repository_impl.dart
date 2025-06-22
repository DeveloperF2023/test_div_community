import 'package:dartz/dartz.dart';
import 'package:test_div_community/core/error/failure.dart';
import 'package:test_div_community/features/data/data_sources/notification/notification_remote_data_source_impl.dart';
import 'package:test_div_community/features/domain/entities/notification/notification_entity.dart';
import 'package:test_div_community/features/domain/repository/notification_repository.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final NotificationRemoteDataSourceImpl notificationRemoteDataSourceImpl;

  NotificationRepositoryImpl({required this.notificationRemoteDataSourceImpl});
  @override
  Future<Either<Failure, List<NotificationEntity>>> getAllNotification() async {
    try {
      final result = await notificationRemoteDataSourceImpl
          .getAllNotifications();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }
}
