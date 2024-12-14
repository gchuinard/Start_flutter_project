import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterBluePlus flutterBlue = FlutterBluePlus();
  List<ScanResult> connectableDevices = [];

  @override
  void initState() {
    super.initState();
    startBluetoothScan();
  }

  @override
  void dispose() {
    FlutterBluePlus.stopScan();
    super.dispose();
  }

  void startBluetoothScan() {
    setState(() {
      connectableDevices.clear(); // Réinitialiser la liste avant chaque scan
    });

    FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));

    // Écouter les résultats de scan
    FlutterBluePlus.scanResults.listen((results) {
      setState(() {
        // Filtrer uniquement les appareils connectables
        connectableDevices = results
            .where((result) => result.advertisementData.connectable)
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Running App - Bluetooth'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: startBluetoothScan, // Relancer le scan
          ),
        ],
      ),
      body: connectableDevices.isEmpty
          ? const Center(child: Text('Aucun appareil connectable trouvé.'))
          : ListView.builder(
        itemCount: connectableDevices.length,
        itemBuilder: (context, index) {
          final device = connectableDevices[index].device;
          final result = connectableDevices[index];
          return ListTile(
            title: Text(device.name.isNotEmpty ? device.name : 'Appareil inconnu'),
            subtitle: Text(device.id.toString()), // Adresse MAC
            trailing: Text(result.rssi.toString()), // Force du signal
            onTap: () {
              // Se connecter à l'appareil lorsque l'utilisateur appuie dessus
              connectToDevice(device);
            },
          );
        },
      ),
    );
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Connecté à ${device.name}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la connexion : $e')),
      );
    }
  }
}
