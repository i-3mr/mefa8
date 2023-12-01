import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/providers/pin.dart';

class Service extends ConsumerWidget {
  const Service({
    super.key,
    required this.title,
    required this.active,
  });

  final String title;
  final bool active;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final pin = AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(active ? Const.lightGreen : Const.lightGray),
      ),
      child: Icon(
        FontAwesomeIcons.thumbtack,
        color: Color(!active ? Const.primaryGreen : Const.gray),
        size: 17,
      ).animate().tint(
            color: Color(active ? Const.primaryGreen : Const.gray),
            duration: const Duration(milliseconds: 100),
          ),
    );

    final component = Container(
      width: 0.455 * width,
      height: 130 / 200 * 0.455 * width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Icon(
              //   FontAwesomeIcons.book,
              //   color: Color(Const.primaryGreen),
              //   size: 45,
              // ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  ref.read(pinProvider.notifier).change(this, !active);
                },
                child: Transform.rotate(
                  angle: 0.785398,
                  child: pin,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(Const.darkGreen),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );

    // return component;
    return component;
  }

  Service copyWith({
    String? title,
    bool? active,
  }) {
    return Service(
      title: title ?? this.title,
      active: active ?? this.active,
      key: UniqueKey(),
    );
  }
}
