// screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi_tera/services/auth_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final authService = AuthService();
    final user = await authService.getCurrentUser(); // Your method to get current user
    if (mounted) {
      setState(() {
        _currentUser = user;
      });
    }
  }

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

          // Profile Section – now fully dynamic
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          if (_currentUser == null) ...[
            const ListTile(
              leading: Icon(Icons.info, color: Colors.blue),
              title: Text('Not logged in'),
              subtitle: Text('Login to view your profile and save routes'),
            ),
          ] else ...[
            _buildProfileItem(
              icon: Icons.person,
              title: 'Name',
              subtitle: _currentUser!.displayName ?? 'User', // Google sets this, email falls back
            ),
            _buildProfileItem(
              icon: Icons.email,
              title: 'Email',
              subtitle: _currentUser!.email ?? 'Not available',
            ),
            _buildProfileItem(
              icon: Icons.phone,
              title: 'Phone',
              subtitle: 'Not linked', // Firebase Auth doesn't store phone unless you use phone auth
            ),
          ],

          // Logout – only show when logged in
          if (_currentUser != null) ...[
            const Divider(height: 32),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () async {
                await AuthService().signOut();
                if (mounted) {
                  Navigator.pushReplacementNamed(context, '/splash');
                }
              },
            ),
          ],

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

          // Contact Us (unchanged)
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
            onTap: () {},
          ),
          // ... other contact items ...

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
              onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
            ),
            IconButton(
              icon: const Icon(Icons.bookmark),
              onPressed: () => Navigator.pushNamed(context, '/savedRoutes'),
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