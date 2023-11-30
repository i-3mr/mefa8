import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/animations/scale.dart';
import 'package:mefa8/providers/pin.dart';

class Services extends ConsumerWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(pinProvider);

    return Padding(
      padding: EdgeInsets.all(10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: services.map((e) => e).toList(),
      ),
    );
  }
}
