import 'dart:developer';

import '../../index.dart';

void printLog(dynamic data) {
  log("$data", name: "Alaa");
}

void showErrorToast(dynamic message) {
  showToast(
    "$message",
    position: ToastPosition.top,
    dismissOtherToast: true,
    animationCurve: Curves.easeIn,
    duration: Duration(seconds: 4),
    textPadding: EdgeInsets.all(10),
    radius: 15,
    backgroundColor: Colors.red[300],
  );
}

void showSuccessToast(dynamic message,
    [ToastPosition position = ToastPosition.bottom]) {
  showToast(
    "$message",
    position: position,
    duration: Duration(seconds: 4),
    textPadding: EdgeInsets.all(10),
    dismissOtherToast: true,
    radius: 15,
  );
}
