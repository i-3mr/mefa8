import 'package:flutter/material.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/widgets/profile/kfupmTower.dart';
import 'package:mefa8/widgets/profile/profile_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String url =
        "https://st2.depositphotos.com/3758943/6040/i/450/depositphotos_60400957-stock-photo-the-man-in-the-office.jpg";
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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KFUPMTower(
              height: 450,
              widget: ProfileNameAndImage(
                height: 450,
                imageurl: url,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
