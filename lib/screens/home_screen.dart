// screens/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String? _selectedFrom; // New: stores selected starting point
  String? _selectedDestination; // Already existed for To

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
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No new notifications yet'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: Stack(
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
                        ),
                      ),
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
                        // From Location (now tappable)
                        GestureDetector(
                          onTap: () async {
                            final selected = await Navigator.pushNamed(
                              context,
                              '/selectStart',
                            );
                            if (selected != null && selected is String) {
                              setState(() {
                                _selectedFrom = selected;
                              });
                            }
                          },
                          child: _locationTile(
                            icon: Icons.location_on,
                            iconColor: Colors.green,
                            title: 'From',
                            value: _selectedFrom ?? 'Current Location',
                            isPlaceholder: _selectedFrom == null,
                          ),
                        ),

                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            if (_selectedFrom != null &&
                                _selectedDestination != null) {
                              setState(() {
                                final temp = _selectedFrom;
                                _selectedFrom = _selectedDestination;
                                _selectedDestination = temp;
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Select both stops first')),
                              );
                            }
                          },
                          child:
                              const Icon(Icons.swap_vert, color: Colors.grey),
                        ),
                        const SizedBox(height: 10),

                        // To Location (now tappable)
                        GestureDetector(
                          onTap: () async {
                            final selected = await Navigator.pushNamed(
                              context,
                              '/selectDestination',
                            );
                            if (selected != null && selected is String) {
                              setState(() {
                                _selectedDestination = selected;
                              });
                            }
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
                      onPressed: (_selectedFrom == null ||
                              _selectedDestination == null)
                          ? null
                          : () {
                              Navigator.pushNamed(
                                context,
                                '/routeResults',
                                arguments: {
                                  'from': _selectedFrom as String,
                                  'to': _selectedDestination as String,
                                },
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        disabledBackgroundColor: Colors.grey,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Find Route',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // ================= LOGIN LINK =================
                  const SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/login'),
                      child: const Text(
                        'Login for better experience',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
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
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _placeCard('Piazza', 'assets/piazza.jpg'),
                  _placeCard('Merkato', 'assets/merkato.jpg'),
                  _placeCard('Stadium', 'assets/stadium.jpg'),
                  _placeCard('Megenagna', 'assets/megenagna.png'),
                ],
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
      width: 150,
      margin: const EdgeInsets.only(right: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              width: 150,
              height: 170,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.55),
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
            ),
          ],
        ),
      ),
    );
  }
}