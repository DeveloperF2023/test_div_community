import 'package:flutter/material.dart';
import 'package:test_div_community/core/routes/app_routes.dart';
import 'package:test_div_community/features/presentation/pages/detail_student_screen.dart';
import 'package:test_div_community/features/presentation/pages/history_attendance_screen.dart';
import 'package:test_div_community/features/presentation/pages/main_screen.dart';
import 'package:test_div_community/features/presentation/pages/notification_screen.dart';

import '../../features/presentation/pages/home_screen.dart';
import '../../features/presentation/pages/onboarding_screen.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.splash:
        return routeBuilder(const OnboardingScreen());
      case AppRoutes.home:
        return routeBuilder(const HomeScreen());
      case AppRoutes.main:
        return routeBuilder(const MainScreen());
      case AppRoutes.historyAttendance:
        return routeBuilder(const HistoryAttendanceScreen());
      case AppRoutes.detailStudent:
        if (args is int) {
          return routeBuilder(DetailStudentScreen(studentId: args));
        }
      case AppRoutes.notifications:
        return routeBuilder(const NotificationScreen());
    }
  }
}

dynamic routeBuilder(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page not found")),
      body: const Center(child: Text("Page not found")),
    );
  }
}
