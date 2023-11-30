import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/widgets/home/service.dart';

final pinProvider = StateNotifierProvider<PinNotifier, List<Service>>(
  (ref) => PinNotifier(const [
    Service(
      title: "test",
      active: true,
    ),
    Service(
      title: "test",
      active: true,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
  ]),
);

class PinNotifier extends StateNotifier<List<Service>> {
  PinNotifier(super.state);

  void change(Service service, bool active) {
    int index = state.indexOf(service);

    state = [
      ...state.sublist(0, index),
      Service(
        title: service.title,
        active: active,
      ),
      ...state.sublist(index + 1),
    ];
  }
}
