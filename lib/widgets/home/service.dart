import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/providers/pin.dart';

class Service extends ConsumerWidget {
  const Service({super.key, required this.title, required this.active});

  final String title;
  final bool active;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
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
                  log('Service onTap');
                  ref.read(pinProvider.notifier).change(this, !active);
                },
                child: Transform.rotate(
                  angle: 0.785398,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(active ? Const.lightGreen : Const.lightGray),
                    ),
                    child: Icon(
                      FontAwesomeIcons.thumbtack,
                      color: Color(active ? Const.primaryGreen : Const.gray),
                      size: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Service copyWith({
    String? title,
    bool? active,
  }) {
    return Service(
      title: title ?? this.title,
      active: active ?? this.active,
    );
  }
}
