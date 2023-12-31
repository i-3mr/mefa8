import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/screens/student_id.dart';
import 'package:mefa8/widgets/studentId/student-id.dart';
import 'package:url_launcher/url_launcher.dart';

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
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            animation = false;
            double dy = details.delta.dy;
            lastDy = dy;

            if (_currentSliderValue + dy < 0) return;

            if (_currentSliderValue + dy > 0.70 * height && dy > 0) return;
            _currentSliderValue = _currentSliderValue + dy;
            // print(_currentSliderValue);
          });
        },
        onPanEnd: (details) {
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
        child: TweenAnimationBuilder(
          duration: Duration(milliseconds: animation ? 750 : 0),
          curve: animation ? Curves.fastOutSlowIn : Curves.easeIn,
          tween: Tween<double>(begin: 0.0, end: _currentSliderValue),
          builder: (context, value, child) {
            return GlassContainer(
              height: 0.18 * height + value,
              width: width,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.40),
                  Colors.white.withOpacity(0.40)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderGradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.60),
                  Colors.white.withOpacity(0.60),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // stops: [0.0, 0.39, 0.40, 1.0],
              ),
              blur: 15.0,
              borderWidth: 1.5,
              elevation: 3.0,
              // isFrostedGlass: true,
              // shadowColor: Color.fromARGB(255, 184, 255, 205),
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(8.0),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
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
                  0.18 * height + value > 0.5 * height
                      ? Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(Const.primaryGreen),
                                spreadRadius: 1,
                                blurRadius: 90, // changes position of shadow
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image(
                              image: NetworkImage(widget.imageUrl),
                              height: 0.18 * height,
                              width: 0.18 * height,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ).animate().scaleXY(
                            begin: 0.78,
                            end: 1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          )
                      : Container(),
                  0.18 * height + value > 0.55 * height
                      ? Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(Const.primaryGreen),
                                spreadRadius: 1,
                                blurRadius: 90, // changes position of shadow
                              ),
                            ],
                          ),
                          child: const Column(
                            children: [
                              Text(
                                "Computer Science",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Junior",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 109, 109, 109),
                                ),
                              ),
                              Text(
                                "201700000",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 109, 109, 109),
                                ),
                              ),
                            ],
                          ),
                        ).animate().scaleXY(
                            begin: 0.78,
                            end: 1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          )
                      : Container(),
                  0.18 * height + value > 0.7 * height
                      ? Container(
                          margin: const EdgeInsets.symmetric(vertical: 30),
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(Const.primaryGreen),
                                spreadRadius: 1,
                                blurRadius: 90, // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Column(
                                children: [
                                  Text(
                                    "GPA",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "3.5",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(Const.primaryGreen),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: 2,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              const Column(
                                children: [
                                  Text(
                                    "Hours",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "80",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(Const.primaryGreen),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ).animate().scaleXY(
                            begin: 0.78,
                            end: 1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          )
                      : Container(),
                  0.18 * height + value > 0.75 * height
                      ? Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(Const.primaryGreen),
                                spreadRadius: 1,
                                blurRadius: 90, // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "Advisor",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  final Uri emailLaunchUri = Uri(
                                    scheme: 'mailto',
                                    path: 'smith@example.com',
                                  );

                                  launchUrl(emailLaunchUri);
                                },
                                child: Text(
                                  "Dr. Ahmed Ibrahim",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        Color.fromARGB(255, 109, 109, 109),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 109, 109, 109),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ).animate().scaleXY(
                            begin: 0.78,
                            end: 1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          )
                      : Container(),
                  0.18 * height + value > 0.85 * height
                      ? Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(Const.primaryGreen),
                                spreadRadius: 1,
                                blurRadius: 90, // changes position of shadow
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const StudentIDScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 217, 255, 217),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: const Text(
                                "البطاقة التعريفية",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(Const.primaryGreen),
                                ),
                              ),
                            ),
                          ),
                        ).animate().scaleXY(
                            begin: 0.78,
                            end: 1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          )
                      : Container(),
                  const Spacer(
                    flex: 2,
                  ),
                  Container(
                    width: width,
                    height: 0.02 * height,
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
