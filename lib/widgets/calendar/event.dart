import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mefa8/const.dart';

class EventWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final DateTime date;
  final bool isFavorite;
  final String organizer;
  final String organizerImageUrl;
  const EventWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.date,
    required this.isFavorite,
    required this.organizer,
    required this.organizerImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    const double height = 300;
    return SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "\t\t\t\t${getCountdown(date)}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: date.difference(DateTime.now()).inDays == 0 ||
                            date.difference(DateTime.now()).inDays == 1
                        ? ""
                        : DateFormat('EEEE, dd MMMM').format(date),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 130, 130, 130),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Stack(
              children: [
                Container(
                  height: height - 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3),
                        BlendMode.darken,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      isFavorite
                          ? Icons.notification_add
                          : Icons.notification_add_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 10,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 2, horizontal: 2),
                    height: height / 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 25, 25, 25)
                          .withOpacity(0.6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Text(
                            organizer,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: NetworkImage(organizerImageUrl),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: height / 4,
                    width: width - 30,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(35)),
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                location,
                                style: const TextStyle(
                                    color: Color(Const.gray), fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getCountdown(DateTime eventDate) {
    var now = DateTime.now();
    var difference = eventDate.difference(now);

    String result;
    if (difference.inDays == 0) {
      if (now.day == eventDate.day) {
        result = 'Today, at ${DateFormat('j').format(eventDate)} ';
      } else {
        result = 'Tomorrow, at ${DateFormat('j').format(eventDate)} ';
      }
    } else if (difference.inDays > 0) {
      result = '${difference.inDays} days remaining, ';
    } else {
      result = '${-difference.inDays} days ago, ';
    }

    return result;
  }
}
