import 'package:test_div_community/core/api/api_helper.dart';
import 'package:test_div_community/features/data/data_sources/students/student_remote_data_source.dart';
import 'package:test_div_community/features/data/models/students/filtered_student_model.dart';
import 'package:test_div_community/features/data/models/students/student_model.dart';

import '../../../../core/api/endpoints_constants.dart';

class StudentRemoteDataSourceImpl implements StudentRemoteDataSource {
  final ApiHelper apiHelper;

  StudentRemoteDataSourceImpl({required this.apiHelper});
  @override
  Future<List<StudentModel>> getAllStudents() async {
    final response = await apiHelper.getRequest(
      endpoint: EndpointsConstants.students,
    );
    return StudentModel.fromJsonList(response.data);
  }

  @override
  Future<List<FilteredStudentModel>> getFilteredStudents(String gender) async {
    final response = await apiHelper.getRequest(
      endpoint: "${EndpointsConstants.baseUrl}students/gender/$gender",
    );
    return FilteredStudentModel.fromJsonList(response.data);
  }

  @override
  Future<StudentModel> getDetailOfStudentById(int studentId) async {
    final response = await apiHelper.getRequest(
      endpoint: "${EndpointsConstants.baseUrl}students/$studentId",
    );
    return StudentModel.fromJson(response.data);
  }
}
