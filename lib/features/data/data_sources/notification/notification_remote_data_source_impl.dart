import 'package:test_div_community/core/api/api_helper.dart';
import 'package:test_div_community/features/data/data_sources/notification/notification_remote_data_source.dart';
import 'package:test_div_community/features/data/models/notification/notification_model.dart';

import '../../../../core/api/endpoints_constants.dart';

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final ApiHelper apiHelper;

  NotificationRemoteDataSourceImpl({required this.apiHelper});
  @override
  Future<List<NotificationModel>> getAllNotifications() async {
    final response = await apiHelper.getRequest(
      endpoint: "${EndpointsConstants.baseUrl}notifications",
    );
    return NotificationModel.fromJsonList(response.data);
  }
}
