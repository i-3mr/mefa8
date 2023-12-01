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
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
    ),
    Service(
      title: "test",
      active: false,
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
    List<Service> newState = [];

    for (int i = 0; i < state.length; i++) {
      if (i == index) {
        service = state[i].copyWith(active: active);
        if (active) {
          newState.insert(0, service);
        } else {
          newState.insert(state.length - 1, service);
        }
      } else {
        newState.add(state[i]);
      }
    }
    state = [...newState];
  }
}
