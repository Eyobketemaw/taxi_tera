// screens/saved_routes_screen.dart
import 'package:flutter/material.dart';

class SavedRoutesScreen extends StatelessWidget {
  const SavedRoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SavedRoute> savedRoutes = [
      SavedRoute(
        'Merkato to Mexico',
        'Route 1',
        '1 transfer',
        '25 min',
        '20 Birr',
      ),
      SavedRoute(
        'Merkato to Mexico',
        'Route 4',
        '1 transfer',
        '28 min',
        '24 Birr',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Routes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quick access to your favorite routes',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: savedRoutes.length,
                itemBuilder: (context, index) {
                  return _buildSavedRouteCard(savedRoutes[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            IconButton(
              icon: const Icon(Icons.bookmark, color: Colors.blue),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedRouteCard(SavedRoute route) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              route.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              route.routeName,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildDetailChip(
                  Icons.transfer_within_a_station,
                  route.transfers,
                ),
                const SizedBox(width: 8),
                _buildDetailChip(
                  Icons.access_time,
                  route.time,
                ),
                const SizedBox(width: 8),
                _buildDetailChip(
                  Icons.money,
                  route.fare,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailChip(IconData icon, String text) {
    return Chip(
      avatar: Icon(icon, size: 16),
      label: Text(text),
      backgroundColor: Colors.grey[100],
    );
  }
}

class SavedRoute {
  final String title;
  final String routeName;
  final String transfers;
  final String time;
  final String fare;

  SavedRoute(
    this.title,
    this.routeName,
    this.transfers,
    this.time,
    this.fare,
  );
}