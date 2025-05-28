
import 'dart:ui';

import 'package:pigeon/core/constants/app_colors.dart';
import 'package:pigeon/core/widgets/app_snackbar.dart';

abstract class Failure {
   Failure({
    required this.errorMessage, this.color
  });
  final String errorMessage;
  Color? color;
}

class AnyFailure extends Failure {
  AnyFailure({required super.errorMessage, super.color}) {
    showSnackBar(errorMessage, color ?? AppColors.redColor);
  }
}
