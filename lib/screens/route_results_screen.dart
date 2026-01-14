// screens/route_results_screen.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RouteResultsScreen extends StatelessWidget {
  const RouteResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Extract from & to from navigation arguments
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String from = args?['from'] as String? ?? 'Unknown';
    final String to = args?['to'] as String? ?? 'Unknown';

    // Now use from & to normally
    return Scaffold(
      appBar: AppBar(
        title: Text('$from → $to'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$from to $to',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('routes')
                    .where('from', isEqualTo: from)
                    .where('to', isEqualTo: to)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error loading routes. Please try again.'),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final routeDocs = snapshot.data?.docs ?? [];

                  if (routeDocs.isEmpty) {
                    return const Center(
                      child: Text(
                        'No routes found for this path.\nTry different stops!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${routeDocs.length} route${routeDocs.length != 1 ? 's' : ''} found',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: routeDocs.length,
                          itemBuilder: (context, index) {
                            final data =
                                routeDocs[index].data() as Map<String, dynamic>;
                            final transfers = data['transfers'] as int? ?? 0;
                            final duration =
                                data['duration'] as String? ?? 'Unknown';
                            final price = data['price'] as num? ?? 0;

                            return _buildRouteCard(
                              context,
                              RouteInfo(
                                'Route ${index + 1}',
                                '$transfers transfer${transfers > 1 ? 's' : ''}',
                                duration,
                                '$price Birr',
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          route.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          route.transfers,
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
                  const Icon(Icons.transfer_within_a_station,
                      size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(route.transfers, style: const TextStyle(fontSize: 12)),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(route.time, style: const TextStyle(fontSize: 12)),
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
          // TODO: Later pass the full route data or route ID to detailed screen
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
