import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

@immutable
abstract class BluetoothEvent {}

class StartScanEvent extends BluetoothEvent {}

class DeviceSelectedEvent extends BluetoothEvent {
  final BluetoothDevice device;

  DeviceSelectedEvent(this.device);
}
