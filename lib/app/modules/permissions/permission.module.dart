import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void checkPermission(context) async {
  final PermissionStatus status = await Permission.locationWhenInUse.request();
  if (status == PermissionStatus.granted) {
    // Location access granted
  } else if (status == PermissionStatus.permanentlyDenied ||
      status == PermissionStatus.denied) {
    // checkPermission(context);
    // Location access permanently denied, navigate to app settings
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              title: const Text("Location Permission"),
              content: const Text(
                  'This app needs location permission to function properly.'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => checkPermission(context),
                ),
              ],
            ));
  }
}
