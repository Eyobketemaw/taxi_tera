// screens/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String? _selectedDestination;

  final Color primaryPurple = const Color(0xFF4B32D3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= PURPLE HEADER =================
            Container(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
              decoration: BoxDecoration(
                color: primaryPurple,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(28),
                ),
              ),
              child: Column(
                children: [
                  // Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'TAXI TERA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Stack(
                        children: [
                          const Icon(Icons.notifications_none,
                              color: Colors.white),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 14,
                              height: 14,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 25),

                  // ================= ROUTE CARD =================
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        _locationTile(
                          icon: Icons.location_on,
                          iconColor: Colors.green,
                          title: 'From',
                          value: 'Current Location',
                          isPlaceholder: true,
                        ),
                        const SizedBox(height: 10),
                        const Icon(Icons.swap_vert, color: Colors.grey),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/selectDestination')
                                .then((value) {
                              if (value != null) {
                                setState(() {
                                  _selectedDestination = value as String;
                                });
                              }
                            });
                          },
                          child: _locationTile(
                            icon: Icons.location_on,
                            iconColor: Colors.red,
                            title: 'To',
                            value: _selectedDestination ?? 'Select destination',
                            isPlaceholder: _selectedDestination == null,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ================= FIND ROUTE =================
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _selectedDestination == null
                          ? null
                          : () => Navigator.pushNamed(context, '/routeResults'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade400,
                        disabledBackgroundColor: const Color.fromARGB(255, 1, 10, 107),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Find Route',
                        style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // ================= POPULAR PLACES =================
const SizedBox(height: 25),

const Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      'Popular Places',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

const SizedBox(height: 16),

SizedBox(
  height: 170, // ⬅️ increased height
  child: ListView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    children: [
      _placeCard('Piazza', 'assets/piazza.jpg'),
      _placeCard('Merkato', 'assets/merkato.jpg'),
      _placeCard('Stadium', 'assets/stadium.jpg'),
      _placeCard('Megenagna', 'assets/megenagna.jpg'),

    ],
  ),
),


            // ================= LOGIN LINK =================
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/login'),
              child: const Text(
                'Login for better user experience',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),

      // ================= BOTTOM NAV =================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: primaryPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() => _currentIndex = index);
          if (index == 1) Navigator.pushNamed(context, '/savedRoutes');
          if (index == 2) Navigator.pushNamed(context, '/settings');
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  // ================= HELPERS =================

  Widget _locationTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
    bool isPlaceholder = false,
  }) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: isPlaceholder ? Colors.grey : Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _placeCard(String title, String imagePath) {
  return Container(
    width: 150, // ⬅️ wider cards
    margin: const EdgeInsets.only(right: 14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
    alignment: Alignment.bottomCenter,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.55),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(18),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    ),
  );
}

}
