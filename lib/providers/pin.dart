import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/widgets/home/service.dart';

final pinProvider = StateNotifierProvider<PinNotifier, List<Service>>(
  (ref) => PinNotifier(const [
    Service(
      title: "QR Code",
      active: true,
    ),
    Service(
      title: "955",
      active: false,
    ),
    Service(
      title: "841",
      active: false,
    ),
    Service(
      title: "164",
      active: false,
    ),
    Service(
      title: "Exam Schedule",
      route: "/exams",
      active: false,
    ),
  ]),
);

class PinNotifier extends StateNotifier<List<Service>> {
  PinNotifier(super.state);

  void change(Service service, bool active) {
    int index = state.indexOf(service);
    List<Service> newState;

    if (active) {
      newState = [
        service.copyWith(active: active),
        ...state.sublist(0, index),
        ...state.sublist(index + 1),
      ];
    } else {
      newState = [
        ...state.sublist(0, index),
        service.copyWith(active: active),
        ...state.sublist(index + 1),
      ];
    }

    newState.sort((a, b) => a.active ? -1 : 1);

    state = [...newState];
  }
}
