import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_div_community/features/presentation/widgets/global/primary_button.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/utils/helper_functions.dart';
import '../widgets/students/widgets_imports.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  List<MyNotification> notifications = [];

  @override
  void initState() {
    super.initState();
    requestPermissions();
    initializeNotifications();
  }

  Future<void> requestPermissions() async {
    final status = await Permission.notification.status;
    if (!status.isGranted) {
      final result = await Permission.notification.request();
      if (!result.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Notification permission denied")),
        );
      }
    }
  }

  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_app');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) {
        // Here you can handle notification tapped
      },
    );
  }

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'channel_id',
          'channel_name',
          channelDescription: 'channel description',
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    final now = DateTime.now();

    await flutterLocalNotificationsPlugin.show(
      now.millisecondsSinceEpoch ~/ 1000,
      'Test Notification',
      'This is a test notification at ${DateFormat.Hm().format(now)}',
      notificationDetails,
    );

    setState(() {
      notifications.insert(
        0,
        MyNotification(
          title: 'Test Notification',
          body: 'This is a test notification at ${DateFormat.Hm().format(now)}',
          receivedAt: now,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: HelperFunctions.screenHeight(context) * .06,
            floating: false,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: HeaderStudentProfile(
                title: 'Notification',
                onNavigate: () => Navigator.pushNamed(context, AppRoutes.main),
              ),
            ),
            backgroundColor: HelperFunctions.isDarkMode(context)
                ? AppColors.dark
                : AppColors.white,
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                PrimaryButton(
                  textButton: 'Show Test Notification',
                  onTap: showNotification,
                ),
                SizedBox(height: 20),
                notifications.isEmpty
                    ? Center(
                        child: Text(
                          'No notifications yet',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                    : ListView.builder(
                        itemCount: notifications.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final notif = notifications[index];
                          return ListTile(
                            title: Text(notif.title),
                            subtitle: Text(notif.body),
                            trailing: Text(
                              DateFormat('MMMEd').format(notif.receivedAt),
                            ),
                          );
                        },
                      ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class MyNotification {
  final String title;
  final String body;
  final DateTime receivedAt;

  MyNotification({
    required this.title,
    required this.body,
    required this.receivedAt,
  });
}
