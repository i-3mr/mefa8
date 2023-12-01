import 'package:flutter/material.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/widgets/profile/kfupmTower.dart';
import 'package:mefa8/widgets/profile/profile_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.email,
      required this.phone,
      required this.major,
      required this.GPA,
      required this.remainingHours});

  final String name;
  final String imageUrl;
  final String email;
  final String phone;
  final String major;
  final double GPA;
  final int remainingHours;

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
          'My info',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KFUPMTower(
              height: 450,
              widget: ProfileNameAndImage(
                GPA: GPA,
                major: major,
                name: name,
                remainingHours: remainingHours,
                height: 450,
                imageurl: imageUrl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
