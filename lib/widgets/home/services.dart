import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/animations/scale.dart';
import 'package:mefa8/providers/pin.dart';

class Services extends ConsumerWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(pinProvider);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Wrap(
          spacing: width * 0.02,
          runSpacing: width * 0.02,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: services.map((e) {
            return ScaleAnimation(
                child: e,
                onTap: () {
                  Navigator.pushNamed(context, e.route);
                });
          }).toList(),
        ),
      ),
    );
  }
}
