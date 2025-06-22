import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_div_community/features/domain/repository/attendance_repository.dart';
import 'package:test_div_community/features/domain/repository/student_repository.dart';
import 'package:test_div_community/features/domain/use_case/attendance/create_multiple_attendance_use_case.dart';
import 'package:test_div_community/features/domain/use_case/attendance/fetch_attendance_by_date_use_case.dart';
import 'package:test_div_community/features/domain/use_case/attendance/fetch_count_of_status_by_date_use_case.dart';
import 'package:test_div_community/features/domain/use_case/attendance/fetch_status_count_attendance_of_student_use_case.dart';
import 'package:test_div_community/features/domain/use_case/notification/fetch_all_notification_use_case.dart';
import 'package:test_div_community/features/domain/use_case/students/fetch_detail_student_id_use_case.dart';
import 'package:test_div_community/features/domain/use_case/students/fetch_filtered_students_use_case.dart';
import 'package:test_div_community/features/domain/use_case/students/fetch_students_use_case.dart';
import 'package:test_div_community/features/presentation/manager/attendance/create_multiple_attendance/create_multiple_attendance_cubit.dart';
import 'package:test_div_community/features/presentation/manager/attendance/get_attendance_by_date/get_attendance_by_date_cubit.dart';
import 'package:test_div_community/features/presentation/manager/attendance/get_count_of_attendance_for_student/get_count_of_attendance_for_student_cubit.dart';
import 'package:test_div_community/features/presentation/manager/attendance/get_count_of_attendance_status/get_count_of_attendance_status_cubit.dart';
import 'package:test_div_community/features/presentation/manager/notification/get_notifications/get_notifications_cubit.dart';
import 'package:test_div_community/features/presentation/manager/students/get_detail_student/get_detail_student_cubit.dart';
import 'package:test_div_community/features/presentation/manager/students/get_filtered_student/get_filtered_student_cubit.dart';
import 'package:test_div_community/features/presentation/manager/students/get_students/get_students_cubit.dart';

import 'core/api/api_helper.dart';
import 'features/data/data_sources/attendance/attendance_remote_data_source.dart';
import 'features/data/data_sources/attendance/attendance_remote_data_source_impl.dart';
import 'features/data/data_sources/notification/notification_remote_data_source.dart';
import 'features/data/data_sources/notification/notification_remote_data_source_impl.dart';
import 'features/data/data_sources/students/student_remote_data_source.dart';
import 'features/data/data_sources/students/student_remote_data_source_impl.dart';
import 'features/data/repository/attendance_repository_impl.dart';
import 'features/data/repository/notification_repository_impl.dart';
import 'features/data/repository/student_repository_impl.dart';
import 'features/domain/repository/notification_repository.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerFactory(
    () => GetStudentsCubit(fetchStudentsUseCase: locator.call()),
  );
  locator.registerFactory(
    () => GetFilteredStudentCubit(fetchFilteredStudentsUseCase: locator.call()),
  );
  locator.registerFactory(
    () => CreateMultipleAttendanceCubit(
      createMultipleAttendanceUseCase: locator.call(),
    ),
  );
  locator.registerFactory(
    () =>
        GetAttendanceByDateCubit(fetchAttendanceByDateUseCase: locator.call()),
  );
  locator.registerFactory(
    () => GetCountOfAttendanceStatusCubit(
      fetchCountOfAttendanceStatusByDateUseCase: locator.call(),
    ),
  );
  locator.registerFactory(
    () => GetNotificationsCubit(fetchAllNotificationUseCase: locator.call()),
  );

  locator.registerFactory(
    () => GetDetailStudentCubit(fetchDetailStudentByIdUseCase: locator.call()),
  );
  locator.registerFactory(
    () => GetCountOfAttendanceForStudentCubit(
      fetchCountOfAttendanceStatusOfStudentUseCase: locator.call(),
    ),
  );

  ///Use Case
  locator.registerLazySingleton(
    () => FetchStudentsUseCase(repository: locator.call()),
  );
  locator.registerLazySingleton(
    () => FetchFilteredStudentsUseCase(repository: locator.call()),
  );
  locator.registerLazySingleton(
    () => CreateMultipleAttendanceUseCase(repository: locator.call()),
  );
  locator.registerLazySingleton(
    () => FetchAttendanceByDateUseCase(repository: locator.call()),
  );
  locator.registerLazySingleton(
    () => FetchCountOfAttendanceStatusByDateUseCase(repository: locator.call()),
  );
  locator.registerLazySingleton(
    () => FetchDetailStudentByIdUseCase(repository: locator.call()),
  );
  locator.registerLazySingleton(
    () => FetchCountOfAttendanceStatusOfStudentUseCase(
      repository: locator.call(),
    ),
  );
  locator.registerLazySingleton(
    () => FetchAllNotificationUseCase(repository: locator.call()),
  );

  ///Repository
  locator.registerLazySingleton<StudentRepository>(
    () => StudentRepositoryImpl(studentRemoteDataSource: locator.call()),
  );
  locator.registerLazySingleton<AttendanceRepository>(
    () => AttendanceRepositoryImpl(
      attendanceRemoteDataSourceImpl: locator.call(),
    ),
  );
  locator.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(
      notificationRemoteDataSourceImpl: locator.call(),
    ),
  );

  ///Data Source
  locator.registerLazySingleton<StudentRemoteDataSource>(
    () => StudentRemoteDataSourceImpl(apiHelper: locator.call()),
  );
  locator.registerLazySingleton<StudentRemoteDataSourceImpl>(
    () => StudentRemoteDataSourceImpl(apiHelper: locator()),
  );

  locator.registerLazySingleton<AttendanceRemoteDataSource>(
    () => AttendanceRemoteDataSourceImpl(apiHelper: locator.call()),
  );
  locator.registerLazySingleton<AttendanceRemoteDataSourceImpl>(
    () => AttendanceRemoteDataSourceImpl(apiHelper: locator()),
  );

  locator.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSourceImpl(apiHelper: locator.call()),
  );
  locator.registerLazySingleton<NotificationRemoteDataSourceImpl>(
    () => NotificationRemoteDataSourceImpl(apiHelper: locator()),
  );

  ///External
  locator.registerLazySingleton<ApiHelper>(() => ApiHelper(client: Dio()));
}
