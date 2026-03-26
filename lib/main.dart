import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
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
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: Text('Unlock App'),
            ),
          )
        ],
      ),
    );
  }
}
