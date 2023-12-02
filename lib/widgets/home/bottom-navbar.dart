import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/providers/pages.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    super.key,
    required this.activeIndex,
    required this.icons,
  });

  final int activeIndex;
  final List<IconData> icons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GlassContainer(
      height: 0.115 * height,
      width: width,
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.4),
          Colors.white.withOpacity(0.60),
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
      // margin: const EdgeInsets.only(bottom: 10),
      // padding: const EdgeInsets.all(8.0),
      // borderRadius: const BorderRadius.only(
      //   topLeft: Radius.circular(35),
      //   topRight: Radius.circular(35),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: icons
            .asMap()
            .entries
            .map(
              (e) => GestureDetector(
                onTap: () {
                  ref.read(pagesProvider.notifier).state = e.key;
                },
                child: Container(
                  width: 0.2 * MediaQuery.of(context).size.width,
                  height: 0.1 * MediaQuery.of(context).size.height,
                  color: Colors.transparent,
                  child: Icon(
                    e.value,
                    size: 30,
                    color: activeIndex == e.key
                        ? const Color(Const.primaryGreen)
                        : const Color.fromARGB(100, 0, 0, 0),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
