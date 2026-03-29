import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persone/core/services/biometric_service.dart';
import 'package:persone/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final biometricService = BiometricService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Spacer(),
          SvgPicture.asset(
            'assets/icons/logo.svg',
            width: 80,
            height: 80,
          ),
          SizedBox(height: 20),
          Text(
            'UpTodo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: InkWell(
              borderRadius: BorderRadius.circular(4),
              onTap: () async {
                bool isAuthenticated = await biometricService.authenticate();

                if (isAuthenticated) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Authentication failed'),
                    ),
                  );
                }
              },
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xFF8687E7),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    'Unlock App',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
