import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/providers/pin.dart';

class Service extends ConsumerWidget {
  final String route;
  const Service({
    super.key,
    required this.title,
    required this.active,
    this.route = '',
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
      height: 130 / 200 * 0.55 * width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        // boxShadow: const [
        //   BoxShadow(
        //     color: Color(Const.shadowGreen),
        //     blurRadius: 5,
        //     offset: Offset(0, 2),
        //   ),
        // ],
        border: Border.all(
          color: const Color(Const.shadowGreen),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                FontAwesomeIcons.bity,
                color: Color(Const.primaryGreen),
                size: 65,
              ),
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
          SizedBox(height: 5),
          Row(
            children: [
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 86, 86, 86),
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
