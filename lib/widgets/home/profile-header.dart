import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/screens/profile.dart';
import 'package:mefa8/screens/profile.dart';
import 'package:mefa8/screens/student_id.dart';
import 'package:mefa8/widgets/studentId/student-id.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key, required this.name, required this.imageUrl});

  final String name;
  final String imageUrl;

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  double _currentSliderValue = 0;
  double lastDy = 0;
  bool animation = false;
  bool showProfile = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        duration: Duration(milliseconds: (animation ? 750 : 0)),
        curve: animation ? Curves.fastOutSlowIn : Curves.easeIn,
        height: 0.18 * height + _currentSliderValue,
        width: width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),

          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Color(Const.shadowGreen), width: 1.5),
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.08 * height,
            ),
            Row(
              children: [
                const Spacer(flex: 4),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(flex: 4),
              ],
            ),
            showProfile
                ? StudentId(
                    name: widget.name,
                    imageUrl: widget.imageUrl,
                    birthDate: "1999-01-01",
                    id: "123456789",
                    expireDate: "2022-01-01",
                    nationalId: "192838944",
                  ).animate().scaleXY(
                      begin: 0.75,
                      end: 1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.fastEaseInToSlowEaseOut,
                    )
                : Container(),
            const Spacer(
              flex: 2,
            ),
            GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  animation = false;
                  double dy = details.delta.dy;
                  lastDy = dy;

                  if (_currentSliderValue + dy < 0) return;

                  if (_currentSliderValue + dy > 0.70 * height && dy > 0)
                    return;
                  _currentSliderValue = _currentSliderValue + dy;
                  // print(_currentSliderValue);
                });
              },
              onPanEnd: (details) {
                print("lastDy: $lastDy");
                if (lastDy < 0) {
                  setState(() {
                    _currentSliderValue = 0;
                    animation = true;
                    showProfile = false;
                  });
                } else {
                  setState(() {
                    _currentSliderValue = 0.70 * height;
                    animation = true;
                    showProfile = true;
                  });
                }
              },
              child: Container(
                width: width,
                height: 40,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  height: 5,
                  width: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(97, 158, 158, 158),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
