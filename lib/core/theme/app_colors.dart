import 'package:flutter/material.dart';

@immutable
final class AppColors {
  static const instance = AppColors._();

  const AppColors._();

  final Color primary = const Color(0xffED8811);

  final Color background = const Color(0xff121212);

  final Color whiteColor = const Color(0xffFFFFFF);

  final Color blackColor = const Color(0xff000000);
}
