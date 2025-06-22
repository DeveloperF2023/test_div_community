import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_div_community/features/presentation/pages/onboarding_screen.dart';

import 'core/api/api_helper.dart';
import 'core/routes/on_general_routes.dart';
import 'core/theme/app_theme.dart';
import 'dependencies_injection.dart';
import 'features/data/data_sources/attendance/attendance_remote_data_source.dart';
import 'features/data/data_sources/attendance/attendance_remote_data_source_impl.dart';
import 'features/presentation/manager/attendance/get_attendance_by_date/get_attendance_by_date_cubit.dart';
import 'features/presentation/manager/attendance/get_count_of_attendance_status/get_count_of_attendance_status_cubit.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  Dio dio = Dio();
  ApiHelper client = ApiHelper(client: dio);
  AttendanceRemoteDataSource remoteDataSource = AttendanceRemoteDataSourceImpl(
    apiHelper: client,
  );
  print(remoteDataSource.getAttendanceByDate(DateTime.parse("2025-06-21")));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<GetAttendanceByDateCubit>()),
        BlocProvider(create: (_) => locator<GetCountOfAttendanceStatusCubit>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.darkTheme,
        initialRoute: "/",
        onGenerateRoute: OnGenerateRoute.route,
        routes: {"/": (context) => OnboardingScreen()},
      ),
    );
  }
}
