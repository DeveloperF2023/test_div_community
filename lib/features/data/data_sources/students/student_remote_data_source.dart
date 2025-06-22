import 'package:test_div_community/features/data/models/students/filtered_student_model.dart';
import 'package:test_div_community/features/data/models/students/student_model.dart';

abstract class StudentRemoteDataSource {
  Future<List<StudentModel>> getAllStudents();
  Future<List<FilteredStudentModel>> getFilteredStudents(String gender);
  Future<StudentModel> getDetailOfStudentById(int studentId);
}
