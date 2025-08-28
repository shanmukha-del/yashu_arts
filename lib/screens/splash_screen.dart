import 'package:flutter/material.dart';
import 'dart:async';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Floating bubble animation
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 20).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    // Navigate to HomeScreen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildBubble(double top, double left, double size, Color color) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Positioned(
          top: top + _animation.value,
          left: left,
          child: Container(
            width: size,
            height: size,
            decoration:
                BoxDecoration(color: color.withOpacity(0.3), shape: BoxShape.circle),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade200, Colors.blue.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Floating bubbles
          _buildBubble(100, 50, 30, Colors.white),
          _buildBubble(200, 150, 20, Colors.white),
          _buildBubble(300, 250, 25, Colors.white),
          _buildBubble(150, 300, 15, Colors.white),
          _buildBubble(250, 50, 20, Colors.white),

          // Center logo and text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/app_icon.png', // Your app icon
                  width: 120,
                  height: 120,
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome to YashuArts",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
