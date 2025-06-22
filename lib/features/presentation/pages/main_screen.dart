import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:test_div_community/features/presentation/pages/attendance_screen.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/helper_functions.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  final String? token;
  final Function(String)? onLocaleChange;
  const MainScreen({super.key, this.token, this.onLocaleChange});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem buildBottomNavItem(
    String icon,
    String darkIcon,
    String selectedIcon,
    String label,
    int index,
  ) {
    final isDark = HelperFunctions.isDarkMode(context);
    final isSelected = _selectedIndex == index;
    String iconToShow;
    Color iconColor = isDark ? Colors.white : Colors.black;
    if (isSelected) {
      iconToShow = selectedIcon;
    } else {
      iconToShow = isDark ? darkIcon : icon;
    }

    return BottomNavigationBarItem(
      icon: Iconify(iconToShow, color: iconColor),
      activeIcon: Iconify(iconToShow, color: AppColors.primaryColor),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[const HomeScreen(), const AttendanceScreen()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: Theme.of(context).textTheme.titleLarge,
        unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
        items: [
          buildBottomNavItem(
            Ri.home_3_line,
            Ri.home_3_line,
            Ri.home_3_fill,
            "Home",
            0,
          ),
          buildBottomNavItem(
            Ph.list_checks,
            Ph.list_checks,
            Ph.list_checks,
            "Attendance",
            1,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: HelperFunctions.isDarkMode(context)
            ? AppColors.white
            : Colors.black,
        unselectedItemColor: HelperFunctions.isDarkMode(context)
            ? AppColors.white
            : Colors.black,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        iconSize: 25,
        type: BottomNavigationBarType.fixed,

        backgroundColor: HelperFunctions.isDarkMode(context)
            ? AppColors.dark
            : AppColors.light,
      ),
    );
  }
}
