part of 'get_notifications_cubit.dart';

sealed class GetNotificationsState extends Equatable {
  const GetNotificationsState();
}

final class GetNotificationsInitial extends GetNotificationsState {
  @override
  List<Object> get props => [];
}

final class GetNotificationsLoading extends GetNotificationsState {
  @override
  List<Object> get props => [];
}

final class GetNotificationsLoaded extends GetNotificationsState {
  final List<NotificationEntity> notifications;

  GetNotificationsLoaded({required this.notifications});
  @override
  List<Object> get props => [notifications];
}

final class GetNotificationsFailure extends GetNotificationsState {
  final String message;

  GetNotificationsFailure({required this.message});
  @override
  List<Object> get props => [message];
}
