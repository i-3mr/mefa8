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
      margin: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "الخدمات",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
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
          ],
        ),
      ),
    );
  }
}
