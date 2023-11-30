import 'package:flutter/material.dart';
import 'package:mefa8/const.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: const Color(Const.primaryGreen),
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(Const.primaryGreen),
              Color(Const.darkGreen),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                
              ),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
