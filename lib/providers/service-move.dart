import 'package:hooks_riverpod/hooks_riverpod.dart';

final serviceMovementProvider = StateProvider<Map<String, int>>((ref) => {
      "index": -1,
      "newIndex": -1,
    });
