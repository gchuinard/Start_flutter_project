import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothRepository {
  final FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  // Scanner les appareils Bluetooth
  Stream<List<ScanResult>> scanDevices() {
    return flutterBlue.scan(timeout: const Duration(seconds: 4));
  }

  // Se connecter à un appareil
  Future<void> connectToDevice(BluetoothDevice device) async {
    await device.connect();
  }

  // Envoyer des données
  Future<void> sendData(BluetoothDevice device, List<int> data) async {
    final services = await device.discoverServices();
    for (final service in services) {
      for (final characteristic in service.characteristics) {
        if (characteristic.properties.write) {
          await characteristic.write(data);
          break;
        }
      }
    }
  }

  // Déconnexion
  Future<void> disconnectDevice(BluetoothDevice device) async {
    await device.disconnect();
  }
}
