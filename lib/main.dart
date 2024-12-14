import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkPermissions(); // Vérification des permissions Bluetooth
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Running App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), // Page principale de l'application
    );
  }
}



Future<void> checkPermissions() async {
  if (await Permission.bluetoothScan.isDenied) {
    await Permission.bluetoothScan.request();
  }
  if (await Permission.bluetoothConnect.isDenied) {
    await Permission.bluetoothConnect.request();
  }
  if (await Permission.bluetoothScan.isPermanentlyDenied ||
      await Permission.bluetoothConnect.isPermanentlyDenied) {
    // Ouvrir les paramètres si les permissions sont refusées de façon permanente
    await openAppSettings();
  }
}
