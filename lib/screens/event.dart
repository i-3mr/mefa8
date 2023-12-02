import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mefa8/animations/scale.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/widgets/blur.dart';
import 'package:mefa8/widgets/calendar/event.dart';
import 'package:share_plus/share_plus.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key, required this.child});

  final EventWidget child;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          child.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          ScaleAnimation(
            onTap: () async {
              final box = context.findRenderObject() as RenderBox?;

              await Share.share(
                "شاركنا في فعالية ${child.title}\n ${child.imageUrl}",
                subject: "subject",
                sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
              );
            },
            child: Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.all(8.0),
              color: Colors.transparent,
              child: const Icon(
                CupertinoIcons.share,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      // extendBodyBehindAppBar: true,
      body: BlurBackGround(
          child:Column(
            children: [
              Container(
                height: height / 4,
                width: double.infinity,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(child.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  NetworkImage(child.organizerImageUrl),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              child.organizer,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Description',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget fermentum aliquam, nunc nibh ultricies nunc, quis aliquam nisl nunc vel nisl. Donec euism od, nisl eget fermentum aliquam, nunc nibh ultricies nunc, quis aliquam nisl nunc vel nisl.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        ScaleAnimation(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Event added to your calendar'),
                              ),
                            );
                          },
                          child: Container(
                            width: width - 30,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 217, 255, 217),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 198, 232, 198),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: const Text(
                              "تسجيل",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(Const.primaryGreen),
                              ),
                            ),
                          ),
                        ).animate().scaleXY(
                              begin: 0.78,
                              end: 1,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
