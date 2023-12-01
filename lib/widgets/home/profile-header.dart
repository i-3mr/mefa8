import 'package:flutter/material.dart';
import 'package:mefa8/screens/student_id.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.name, required this.imageUrl});

  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const StudentIDScreen();
        }));
      },
      child: Container(
        margin: EdgeInsets.only(top: 0.005 * height),
        padding: EdgeInsets.all(0.005 * height),
        height: 0.08 * height,
        width: 0.95 * width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: Row(
          children: [
            Spacer(flex: 4),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Spacer(flex: 3),
            ClipRRect(
              borderRadius: BorderRadius.circular(0.5 * height),
              child: Image(
                image: Image.network(imageUrl).image,
                height: 0.07 * height,
                width: 0.07 * height,
                fit: BoxFit.cover,
              ),
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
