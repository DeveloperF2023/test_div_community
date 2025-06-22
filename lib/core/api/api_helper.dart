import 'package:dio/dio.dart';

class ApiHelper {
  final Dio client;

  ApiHelper({required this.client});

  Future<Response> getRequest({
    required String endpoint,
    bool includeClassroomId = false,
  }) async {
    try {
      final response = await client.get(endpoint, options: _buildOptions());

      _printDebug(response);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Failed with status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow; // ✅ This line fixes the issue
    } catch (e) {
      throw Exception("Unexpected Error: $e"); // ✅ This is fine
    }
  }

  Future<Response> postRequest({
    required String endpoint,
    required dynamic data,
    bool includeClassroomId = false,
  }) async {
    try {
      final response = await client.post(
        endpoint,
        data: data,
        options: _buildOptions(),
      );

      _printDebug(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        throw Exception("Failed with status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }

  Options _buildOptions() {
    return Options(
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      sendTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 50),
      validateStatus: (status) => status != null && status < 500,
    );
  }

  void _printDebug(Response response) {
    print("Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");
  }

  void _handleDioException(DioException e) {
    print("DioException: ${e.message}");
    throw Exception("Connection Timeout or Network Error");
  }
}
