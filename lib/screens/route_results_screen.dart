// screens/route_results_screen.dart
import 'package:flutter/material.dart';

class RouteResultsScreen extends StatelessWidget {
  const RouteResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<RouteInfo> routes = [
      RouteInfo('Route 1', '1 transfer', '25 min', '20 Birr'),
      RouteInfo('Route 2', '1 transfer', '30 min', '22 Birr'),
      RouteInfo('Route 3', 'Direct', '35 min', '18 Birr'),
      RouteInfo('Route 4', '1 transfer', '28 min', '24 Birr'),
      RouteInfo('Route 5', '2 transfers', '40 min', '25 Birr'),
      RouteInfo('Route 6', '1 transfer', '32 min', '21 Birr'),
      RouteInfo('Route 7', '1 transfer', '33 min', '23 Birr'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Merkato → Mexico',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '7 routes found',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: routes.length,
                itemBuilder: (context, index) {
                  return _buildRouteCard(context, routes[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteCard(BuildContext context, RouteInfo route) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: const Text(
          'Merkato to Mexico',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          route.name,
          style: const TextStyle(color: Colors.blue),
        ),
        trailing: SizedBox(
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.transfer_within_a_station, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    route.transfers,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    route.time,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.money, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    route.fare,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/detailedRoute');
        },
      ),
    );
  }
}

class RouteInfo {
  final String name;
  final String transfers;
  final String time;
  final String fare;

  RouteInfo(this.name, this.transfers, this.time, this.fare);
}