import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Exemple de données d'historique
    final List<Map<String, String>> historyData = [
      {'date': '2024-12-01', 'duration': '30 min', 'distance': '3.5 km'},
      {'date': '2024-12-02', 'duration': '25 min', 'distance': '3.0 km'},
      {'date': '2024-12-03', 'duration': '40 min', 'distance': '5.0 km'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique des Sessions'),
      ),
      body: ListView.builder(
        itemCount: historyData.length,
        itemBuilder: (context, index) {
          final session = historyData[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(
                'Session du ${session['date']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Durée : ${session['duration']} | Distance : ${session['distance']}',
              ),
              leading: const Icon(Icons.history, color: Colors.blue),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Logique pour supprimer une session (ajout possible ici)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Suppression non implémentée')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
