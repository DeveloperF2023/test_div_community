import 'package:test_div_community/core/constants/app_assets.dart';

class UnbordingContent {
  String image;
  String title;
  String description;
  UnbordingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Welcome to MySchool',
    image: AppAssets.splashWelcome1,
    description:
        "Manage your classroom with ease. Connect students, teachers, and school admins in one smart platform.",
  ),
  UnbordingContent(
    title: 'Track Attendance Instantly',
    image: AppAssets.splashAttendanceTracker2,
    description:
        "Take attendance in just one tap. Mark students as present, absent, or late—anytime, anywhere.",
  ),
  UnbordingContent(
    title: 'Stay Connected & Informed',
    image: AppAssets.splashStayConnected2,
    description:
        "Get real-time updates, view attendance history, and communicate easily with parents and staff.",
  ),
];
