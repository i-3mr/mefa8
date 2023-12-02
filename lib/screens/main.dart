import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/providers/pages.dart';
import 'package:mefa8/screens/calendar.dart';
import 'package:mefa8/screens/qr-qode.dart';
import 'package:mefa8/widgets/home/index.dart';
import 'package:mefa8/widgets/home/services.dart';

class Main extends ConsumerWidget {
  const Main({super.key});

  final List<IconData> icons = const [
    FontAwesomeIcons.house,
    FontAwesomeIcons.qrcode,
    FontAwesomeIcons.calendarWeek,
  ];
  final List<Widget> pages = const [
    Services(),
    QrCodeScannerScreen(),
    CalendarScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final int pageIndex = ref.watch(pagesProvider);


    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
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
                Expanded(
                  child: pages[pageIndex],
                ),

              ],
            ),
            Positioned(
              bottom: 0,
              child: BottomNavBar(
                activeIndex: pageIndex,
                icons: icons,
              ),
            ),
            const ProfileHeader(
              name: "عبدالله حجازي",
              imageUrl:
                  "https://labeeb.masdr.sa/assets/images/WelcomeAvatar.png",
            ),
          ],
        ),
      ),
    );
  }
}
