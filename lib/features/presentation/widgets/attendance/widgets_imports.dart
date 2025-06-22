import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_div_community/core/api/endpoints_constants.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_by_date_entity.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../domain/entities/attendance/attendance_status_count_entity.dart';
import '../../manager/attendance/get_attendance_by_date/get_attendance_by_date_cubit.dart';
import '../../manager/attendance/get_count_of_attendance_status/get_count_of_attendance_status_cubit.dart';

part 'count_status_attendance.dart';
part 'header_history_attendance.dart';
part 'loading_history_attendance.dart';
part 'status_item.dart';
part 'status_selector.dart';
part 'student_list_with_status.dart';
