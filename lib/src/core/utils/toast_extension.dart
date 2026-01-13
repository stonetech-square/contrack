import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastHelper {
  final BuildContext context;

  ToastHelper(this.context);

  void success(
    String message, {
    String? title,
    Duration? autoCloseDuration,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: title != null ? Text(title) : null,
      description: Text(message),
      alignment: Alignment.topRight,
      autoCloseDuration: autoCloseDuration ?? const Duration(seconds: 3),
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
    );
  }

  void error(
    String message, {
    String? title,
    Duration? autoCloseDuration,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: title != null ? Text(title) : null,
      description: Text(message),
      alignment: Alignment.topRight,
      autoCloseDuration: autoCloseDuration ?? const Duration(seconds: 4),
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
    );
  }

  void warning(
    String message, {
    String? title,
    Duration? autoCloseDuration,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.warning,
      style: ToastificationStyle.flatColored,
      title: title != null ? Text(title) : null,
      description: Text(message),
      alignment: Alignment.topRight,
      autoCloseDuration: autoCloseDuration ?? const Duration(seconds: 3),
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
    );
  }

  void info(
    String message, {
    String? title,
    Duration? autoCloseDuration,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      title: title != null ? Text(title) : null,
      description: Text(message),
      alignment: Alignment.topRight,
      autoCloseDuration: autoCloseDuration ?? const Duration(seconds: 3),
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
    );
  }
}

extension ToastExtension on BuildContext {
  ToastHelper get toast => ToastHelper(this);
}
