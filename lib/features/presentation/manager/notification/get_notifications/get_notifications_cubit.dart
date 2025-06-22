import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_div_community/features/domain/entities/notification/notification_entity.dart';
import 'package:test_div_community/features/domain/use_case/notification/fetch_all_notification_use_case.dart';

part 'get_notifications_state.dart';

class GetNotificationsCubit extends Cubit<GetNotificationsState> {
  final FetchAllNotificationUseCase fetchAllNotificationUseCase;
  GetNotificationsCubit({required this.fetchAllNotificationUseCase})
    : super(GetNotificationsInitial());

  Future<void> getNotifications() async {
    emit(GetNotificationsLoading());
    try {
      final result = await fetchAllNotificationUseCase.callback();
      result.fold(
        (l) => emit(GetNotificationsFailure(message: l.message)),
        (r) => emit(GetNotificationsLoaded(notifications: r)),
      );
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetNotificationsFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetNotificationsFailure(message: e.toString()));
    }
  }
}
