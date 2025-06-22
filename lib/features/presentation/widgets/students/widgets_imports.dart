import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:test_div_community/core/api/endpoints_constants.dart';
import 'package:test_div_community/core/routes/app_routes.dart';
import 'package:test_div_community/dependencies_injection.dart';
import 'package:test_div_community/features/domain/entities/students/student_entity.dart';
import 'package:test_div_community/features/presentation/manager/attendance/get_count_of_attendance_for_student/get_count_of_attendance_for_student_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/helper_functions.dart';
import '../attendance/widgets_imports.dart';

part 'contact_item.dart';
part 'detail_student_item.dart';
part 'header_profile_student_item.dart';
part 'header_student_profile.dart';
part 'personal_information_item.dart';
part 'single_information_item.dart';
