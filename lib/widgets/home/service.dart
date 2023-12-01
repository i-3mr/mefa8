import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/providers/pin.dart';
import 'package:mefa8/providers/service-move.dart';

class Service extends ConsumerWidget {
  const Service({
    super.key,
    required this.title,
    required this.active,
    required this.index,
  });

  final String title;
  final bool active;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceMoved = ref.watch(serviceMovementProvider);
    final serviceMovedIndex = serviceMoved["index"];
    final newIndex = serviceMoved["newIndex"];

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
            ));
    final component = Container(
      width: 200,
      height: 130,
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
                  int newIndex =
                      ref.read(pinProvider.notifier).change(this, !active);
                  ref.read(serviceMovementProvider.notifier).state = {
                    "index": index,
                    "newIndex": newIndex,
                  };
                  Future.delayed(const Duration(milliseconds: 300), () {
                    ref.read(serviceMovementProvider.notifier).state = {
                      "index": -1,
                      "newIndex": -1,
                    };
                  });
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
                  "$index",
                  style: TextStyle(
                      color: Color(Const.darkGreen),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )
            ],
          )
        ],
      ),
    );

    if (serviceMovedIndex == index) {
      double xMovement = index % 2 == newIndex! % 2
          ? 0
          : index % 2 == 0
              ? 210
              : -210;
      double yMovement = (index ~/ 2 - newIndex ~/ 2) * -140;
      // print("it is not -1, $xMovement, $yMovement");

      return component
          .animate()
          .moveX(
            begin: 0,
            end: xMovement,
            duration: const Duration(milliseconds: 220),
          )
          .moveY(
            begin: 0,
            end: yMovement,
            duration: const Duration(milliseconds: 220),
          );
    }

    // return component;
    return serviceMovedIndex! > index
        ? component
            .animate()
            .moveX(
              begin: 0,
              end: index % 2 == 0 ? 210 : -210,
              duration: const Duration(milliseconds: 220),
            )
            .moveY(
              begin: 0,
              end: index % 2 != 0 ? 140 : 0,
              duration: const Duration(milliseconds: 220),
            )
        : component;
  }

  Service copyWith({
    String? title,
    bool? active,
  }) {
    return Service(
      title: title ?? this.title,
      active: active ?? this.active,
      key: UniqueKey(),
      index: index,
    );
  }
}
