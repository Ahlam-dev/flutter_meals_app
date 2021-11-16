import 'package:flutter/widgets.dart';
import 'package:flutter_meals_app/enums/enumDevice.dart';
class SizingInformation {
  final DeviceType deviceType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.deviceType,
    this.screenSize,
    this.localWidgetSize,
  });
  @override
  String toString() {
    return 'DeviceType:$deviceType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}