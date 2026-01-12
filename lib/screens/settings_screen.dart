// screens/settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Manage your preferences',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          
          // Profile Section
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _buildProfileItem(
            icon: Icons.person,
            title: 'Name',
            subtitle: '',
          ),
          _buildProfileItem(
            icon: Icons.email,
            title: 'Email',
            subtitle: 'Jobeket@gmail.com',
          ),
          _buildProfileItem(
            icon: Icons.phone,
            title: 'Phone',
            subtitle: '0964542432',
          ),
          const Divider(height: 32),
          
          // Dark Mode
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Toggle dark theme'),
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
            },
            secondary: const Icon(Icons.dark_mode),
          ),
          const Divider(height: 32),
          
          // Contact Us
          const Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _buildContactItem(
            icon: Icons.phone,
            title: 'Call Us',
            subtitle: '+251 911 123456',
            onTap: () {
              // Handle call
            },
          ),
          _buildContactItem(
            icon: Icons.chat,
            title: 'WhatsApp',
            subtitle: 'Chat with us',
            onTap: () {
              // Handle WhatsApp
            },
          ),
          _buildContactItem(
            icon: Icons.photo_camera,
            title: 'Instagram',
            subtitle: '@tazitera',
            onTap: () {
              // Handle Instagram
            },
          ),
          _buildContactItem(
            icon: Icons.facebook,
            title: 'Facebook',
            subtitle: 'Taxi Tera',
            onTap: () {
              // Handle Facebook
            },
          ),
          const Divider(height: 32),
          
          // About
          const Text(
            'About Taxi Tera',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const ListTile(
            title: Text('Version'),
            subtitle: Text('1.0.0'),
            leading: Icon(Icons.info),
          ),
        ],
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
              icon: const Icon(Icons.bookmark),
              onPressed: () {
                Navigator.pushNamed(context, '/savedRoutes');
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.blue),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}