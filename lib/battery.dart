import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BatteryLevelService {
  static const platform = MethodChannel('battery_level');

  BatteryLevelService() {
    platform.setMethodCallHandler(_handleMethodCall);
  }

  Future<void> _handleMethodCall(MethodCall call) async {
    if (call.method == 'batteryThresholdReached') {
      Fluttertoast.showToast(msg: 'Battery level is above 90%');
    }
  }

  Future<void> getBatteryLevel() async {
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      print('Battery level is $result%.');
    } on PlatformException catch (e) {
      print('Failed to get battery level: ${e.message}.');
    }
  }
}
