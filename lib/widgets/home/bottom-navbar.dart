import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/icons/calendar_icon.dart';
import 'package:mefa8/icons/home_icon.dart';
import 'package:mefa8/providers/pages.dart';
import 'package:mefa8/screens/calendar.dart';
import 'package:mefa8/screens/profile.dart';
import 'package:mefa8/screens/student_id.dart';
import 'package:svg_flutter/svg.dart';

class BottomNavBar extends StatelessWidget {
  final int index;
  const BottomNavBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      ref.read(PagesProvider.notifier).state = 0;
                    },
                    icon: GestureDetector(
                      onTap: () {},
                      child: CustomPaint(
                        size: Size(
                            30,
                            (30 * 1.05)
                                .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: HomeIcon(
                          color: index == 0
                              ? const Color(Const.primaryGreen)
                              : Colors.grey.shade800,
                        ),
                      ),
                    )),
                index == 0
                    ? const CircleAvatar(
                        radius: 5,
                        backgroundColor: Color(Const.primaryGreen),
                      )
                    : Container(),
              ],
            ),
            GestureDetector(
              onTap: () {
                ref.read(PagesProvider.notifier).state = 1;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CalendarScreen();
                }));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/id_card_icon.svg",
                    color: index == 1
                        ? const Color(Const.primaryGreen)
                        : Colors.grey.shade800,
                    height: 80,
                    width: 80,
                  ),
                  index == 1
                      ? const CircleAvatar(
                          radius: 5,
                          backgroundColor: Color(Const.primaryGreen),
                        )
                      : Container(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                ref.read(PagesProvider.notifier).state = 2;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CalendarScreen();
                }));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPaint(
                    size: const Size(41,
                        41), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: CalendarIcon(
                      index == 2
                          ? const Color(Const.primaryGreen)
                          : Colors.grey.shade800,
                    ),
                  ),
                  index == 2
                      ? const CircleAvatar(
                          radius: 5,
                          backgroundColor: Color(Const.primaryGreen),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
