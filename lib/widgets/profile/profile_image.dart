import 'package:flutter/material.dart';

class ProfileNameAndImage extends StatelessWidget {
  final double height;
  final String imageurl;
  final String name;
  final String major;
  final double GPA;
  final int remainingHours;
  const ProfileNameAndImage({
    super.key,
    required this.height,
    required this.imageurl,
    required this.name,
    required this.major,
    required this.GPA,
    required this.remainingHours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 125,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(imageurl),
            radius: 50,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Text(
            major,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          const SizedBox(
            height: 20,
          ),
          // TODO: add a gpa column and divider and credit hour column
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "      GPA",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Container(
                width: 3,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 193, 193, 193),
                ),
              ),
              const Text(
                "Credit H",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${GPA}",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(
                  child: Divider(
                    thickness: 70,
                    height: 0,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                Text(
                  "${remainingHours}",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
