import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showError(
      BuildContext context, {
        String? message,
      }) {
    _show(
      context,
      message: message?.isNotEmpty == true
          ? message!
          : 'Đã có lỗi xảy ra, vui lòng thử lại',
      backgroundColor: Colors.red.shade700,
    );
  }

  static void showSuccess(
      BuildContext context, {
        required String message,
      }) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.green.shade600,
    );
  }

  static void showInfo(
      BuildContext context, {
        required String message,
      }) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.blue.shade600,
    );
  }

  static void _show(
      BuildContext context, {
        required String message,
        required Color backgroundColor,
      }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}