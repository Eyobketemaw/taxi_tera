// screens/location_search_screen.dart
import 'package:flutter/material.dart';

class SelectStartingPointScreen extends StatelessWidget {
  const SelectStartingPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> landmarks = [
      'Plassa',
      'Merkato',
      'Mexico',
      'Stadium',
      'Bole',
      'Megenagna',
      'Arat Kilo',
      'Legehar',
      'Meskel Square',
      '4 Kilo',
    ];

    final List<String> recentSearches = [
      'Bole to Megenagna',
      'Plassa to Arat Kilo',
      'Merkato to Stadium',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Starting Point'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search location...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
                onChanged: (value) {
                  // Implement search functionality
                },
              ),
            ),
            const SizedBox(height: 20),
            
            // Current Location Option
            GestureDetector(
              onTap: () {
                Navigator.pop(context, 'Current Location');
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue[100]!),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.my_location, color: Colors.blue),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Use Current Location',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'GPS location',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Suggested Landmarks
            const Text(
              'Suggested Landmarks',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: landmarks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.location_on_outlined),
                    title: Text(landmarks[index]),
                    onTap: () {
                      Navigator.pop(context, landmarks[index]);
                    },
                  );
                },
              ),
            ),
            
            // Recent Searches
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              'Recent Searches',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recentSearches.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recentSearches[index]),
                  leading: const Icon(Icons.history, color: Colors.grey),
                  onTap: () {
                    // Handle recent search tap
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SelectDestinationScreen extends StatelessWidget {
  const SelectDestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> landmarks = [
      'Plassa',
      'Merkato',
      'Mexico',
      'Stadium',
      'Bole',
      'Megenagna',
      'Arat Kilo',
      'Legehar',
      'Meskel Square',
      '4 Kilo',
    ];

    final List<String> recentSearches = [
      'Bole to Megenagna',
      'Plassa to Arat Kilo',
      'Merkato to Stadium',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Destination'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search location...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Suggested Landmarks
            const Text(
              'Suggested Landmarks',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: landmarks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.location_on_outlined),
                    title: Text(landmarks[index]),
                    onTap: () {
                      Navigator.pop(context, landmarks[index]);
                    },
                  );
                },
              ),
            ),
            
            // Recent Searches
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              'Recent Searches',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recentSearches.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recentSearches[index]),
                  leading: const Icon(Icons.history, color: Colors.grey),
                  onTap: () {
                    // Handle recent search tap
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}