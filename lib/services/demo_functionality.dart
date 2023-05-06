import 'package:flutter/material.dart';
import 'package:toasty_snackbar/toasty_snackbar.dart';

class DemoFunctionality {
  static void showDemoSubscriptionToast(BuildContext context) {
    String title = "Demo preview";
    String message =
        "This is a demo preview of the app. You can't subscribe to the app in this version.";
    context.showToastySnackbar(
      title,
      message,
      AlertType.error,
    );
  }

  static void showmenu(BuildContext context) {
    String title = 'Demo Preview';
    String message =
        'This is a demo preview so we wont be showing the menu in this app version.';
    context.showToastySnackbar(title, message, AlertType.info);
  }
}
