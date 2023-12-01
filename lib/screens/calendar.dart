import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/widgets/calendar/event.dart';

class CalendarScreen extends HookConsumerWidget {
  const CalendarScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Calendar',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        body: Stack(children: [
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(Const.primaryGreen),
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(Const.primaryGreen),
                  Color(Const.darkGreen),
                ],
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: SizedBox(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return EventWidget(
                        imageUrl:
                            'https://www.zdnet.com/a/img/resize/605df164b50d7127344cce4c41e5e2a36ac951b4/2023/04/05/e0478a88-b3ed-4516-8459-e0b919b4b2bc/artificial-intelligence.jpg?auto=webp&width=1280',
                        title: 'Event Title',
                        location: 'Event Location',
                        date: DateTime(2023, 11, 21),
                        isFavorite: false,
                        organizer: 'Event Organizer',
                        organizerImageUrl:
                            'https://pbs.twimg.com/profile_images/1612289298912378882/n1pvT52b_400x400.jpg');
                  }),
            ),
          )
        ]));
  }
}
