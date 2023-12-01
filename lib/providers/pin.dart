import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/widgets/home/service.dart';

final pinProvider = StateNotifierProvider<PinNotifier, List<Service>>(
  (ref) => PinNotifier(const [
    Service(
      title: "test",
      active: true,
      index: 0,
    ),
    Service(
      title: "test",
      active: false,
      index: 1,
    ),
    Service(
      title: "test",
      active: false,
      index: 2,
    ),
    Service(
      title: "test",
      active: false,
      index: 3,
    ),
    Service(
      title: "test",
      active: false,
      index: 4,
    ),
    Service(
      title: "test",
      active: false,
      index: 5,
    ),
    Service(
      title: "test",
      active: false,
      index: 6,
    ),
    Service(
      title: "test",
      active: false,
      index: 7,
    ),
    Service(
      title: "test",
      active: false,
      index: 8,
    ),
    Service(
      title: "test",
      active: false,
      index: 9,
    ),
    Service(
      title: "test",
      active: false,
      index: 10,
    ),
    Service(
      title: "test",
      active: false,
      index: 11,
    ),
    Service(
      title: "test",
      active: false,
      index: 12,
    ),
    Service(
      title: "test",
      active: false,
      index: 13,
    ),
    Service(
      title: "test",
      active: false,
      index: 14,
    ),
    Service(
      title: "test",
      active: false,
      index: 15,
    ),
    Service(
      title: "test",
      active: false,
      index: 16,
    ),
    Service(
      title: "test",
      active: false,
      index: 17,
    ),
    Service(
      title: "test",
      active: false,
      index: 18,
    ),
    Service(
      title: "test",
      active: false,
      index: 19,
    ),
  ]),
);

class PinNotifier extends StateNotifier<List<Service>> {
  PinNotifier(super.state);

  int change(Service service, bool active) {
    int index = state.indexOf(service);
    print("original index $index");
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
        newState.add(state[i].copyWith(active: state[i].active));
      }
    }
    newState.sort((a, b) => a.active ? -1 : a.index - b.index);

    int newIndex = newState.indexOf(service);

    Future.delayed(const Duration(milliseconds: 300), () {
      state = [...newState];
    });

    return active ? 0 : newIndex;
  }
}
