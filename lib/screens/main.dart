import 'package:flutter/material.dart';
import 'package:mefa8/animations/animated-page.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/widgets/home/index.dart';
import 'package:mefa8/widgets/home/services.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnimatedPage(
        backWidget: const SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          decoration: const BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(20),
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: [
            //     Color(Const.primaryGreen),
            //     Color(Const.darkGreen),
            //   ],
            // ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 0.18 * height,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(Const.primaryGreen),
                                  spreadRadius: 1,
                                  blurRadius: 90, // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(Const.primaryGreen),
                                  spreadRadius: 1,
                                  blurRadius: 120, // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Services(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    child: const BottomNavBar(index: 0),
                  ),
                ],
              ),
              const ProfileHeader(
                name: "عبدالله حجازي",
                imageUrl:
                    "https://avatars.githubusercontent.com/u/17090794?v=4",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
