import 'dart:async';

class MockBluetoothService {
  final StreamController<List<String>> _devicesController =
  StreamController<List<String>>();

  MockBluetoothService() {
    // Simuler des appareils Bluetooth détectés.
    Future.delayed(Duration(seconds: 2), () {
      _devicesController.add([
        "Tapis Pro",
        "Tapis Lite",
        "Tapis Ultra"
      ]);
    });
  }

  Stream<List<String>> get scanResults => _devicesController.stream;

  Future<void> connectToDevice(String deviceName) async {
    print("Simulated connection to $deviceName");
    await Future.delayed(Duration(seconds: 1));
  }

  void startScan() {
    print("Simulated Bluetooth scan started.");
  }

  void stopScan() {
    print("Simulated Bluetooth scan stopped.");
    _devicesController.close();
  }
}
