// widgets/auth_wrapper.dart
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/auth_screens.dart'; // For LoginScreen
import '../services/auth_service.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final _authService = AuthService();
  bool _isLoading = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    try {
      // Replace this with your actual auth check
      // Example if using Firebase: final user = _authService.auth.currentUser;
      // Or add a method in AuthService: bool isLoggedIn = await _authService.isUserLoggedIn();
      final user = await _authService.getCurrentUser(); // You need to implement this

      setState(() {
        _isLoggedIn = user != null;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoggedIn = false;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return _isLoggedIn ? const HomeScreen() : const LoginScreen();
  }
}