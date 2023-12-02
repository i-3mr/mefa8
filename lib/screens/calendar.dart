import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/animations/scale.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/screens/event.dart';
import 'package:mefa8/widgets/calendar/event.dart';

class CalendarScreen extends HookConsumerWidget {
  const CalendarScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              ...[1, 2, 3, 4].map(
                (e) {
                  final EventWidget element = EventWidget(
                    imageUrl: 'https://pbs.twimg.com/media/F_3mAZAWEAAYCwv.jpg',
                    title: 'Flutter Weekend',
                    location: 'Dharah Valley',
                    date: DateTime(2023, 11, 21),
                    isFavorite: false,
                    organizer: 'Event Organizer',
                    organizerImageUrl:
                        'https://pbs.twimg.com/profile_images/1612289298912378882/n1pvT52b_400x400.jpg',
                  );
                  return ScaleAnimation(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventScreen(child: element),
                        ),
                      );
                    },
                    child: element,
                  );
                },
              ),
              SizedBox(
                height: 0.1 * MediaQuery.of(context).size.height,
              )
            ],
          ),
        )
      ],
    );
  }
}
