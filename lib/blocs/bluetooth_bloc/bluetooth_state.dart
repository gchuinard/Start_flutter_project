import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

@immutable
abstract class BluetoothState {}

class BluetoothInitialState extends BluetoothState {}

class BluetoothScanningState extends BluetoothState {}

class BluetoothDevicesFoundState extends BluetoothState {
  final List<BluetoothDevice> devices;

  BluetoothDevicesFoundState(this.devices);
}

class BluetoothConnectedState extends BluetoothState {
  final BluetoothDevice device;

  BluetoothConnectedState(this.device);
}

class BluetoothErrorState extends BluetoothState {
  final String message;

  BluetoothErrorState(this.message);
}
