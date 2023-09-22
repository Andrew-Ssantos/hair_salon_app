import 'package:flutter/material.dart';

sealed class ColorsConstants {
  static const green = Color(0xFFC5EA47);
  static const ligthGreen = Color(0xFFD8F668);
  static const purple = Color(0xFF454AAA);
  static const ligthPurple = Color(0xFF6368C5);
  static const red = Color(0xFFF5614A);
  static const ligthGrey = Color(0xFFCCCCCC);
  static const grey = Color(0xFFAAAAAA);
  static const darkgrey = Color(0xFF7A7A7A);
}

sealed class HsIcons extends IconData {
  const HsIcons(super.codePoint);

  static const editIcon = Icon(
    Icons.edit,
    color: ColorsConstants.ligthGreen,
    size: 24,
  );

  static const deleteIcon = Icon(
    Icons.delete,
    color: ColorsConstants.red,
    size: 24,
  );

  static const homeIcon = Icon(Icons.home_outlined, size: 20);
  static const scheduleIcon = Icon(Icons.calendar_month_outlined, size: 20);
  static const dashboardIcon = Icon(Icons.bar_chart_outlined, size: 20);
  static const servicesIcon = Icon(Icons.workspaces_outline, size: 20);
  static const settingsIcon = Icon(Icons.settings_outlined, size: 20);
}
