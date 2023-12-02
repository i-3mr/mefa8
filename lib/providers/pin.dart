import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/widgets/home/service.dart';

final pinProvider = StateNotifierProvider<PinNotifier, List<Service>>(
  (ref) => PinNotifier(const [
    Service(
      title: "Schedule",
      active: true,
      icon: FontAwesomeIcons.calendarDays,
    ),
    Service(
      title: "Grades",
      active: false,
      icon: FontAwesomeIcons.award,
    ),
    Service(
      title: "Bus Tracker",
      route: '/busTracker',
      active: false,
      icon: FontAwesomeIcons.bus,
    ),
    Service(
      title: "Exam Schedule",
      route: "/exams",
      active: false,
      icon: FontAwesomeIcons.pencil,
    ),
    Service(
      title: "Grades",
      active: false,
      icon: FontAwesomeIcons.award,
    ),
    Service(
      title: "Bus Tracker",
      route: '/busTracker',
      active: false,
      icon: FontAwesomeIcons.bus,
    ),
    Service(
      title: "Exam Schedule",
      route: "/exams",
      active: false,
      icon: FontAwesomeIcons.pencil,
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
