import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mefa8/const.dart';

class ExamCard extends StatelessWidget {
  final String courseName;
  final String examType;
  final int courseCode;
  final DateTime examDate;
  final double height;
  final double width;
  final String examLocation;
  final double syllabusMark;
  const ExamCard(
      {super.key,
      required this.courseName,
      required this.examType,
      required this.examDate,
      this.height = 300,
      this.width = 300,
      required this.examLocation,
      required this.syllabusMark,
      required this.courseCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: height,
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(29, 0, 0, 0),
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$courseName $courseCode",
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  getCountdown(examDate),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 177, 177, 177),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(FontAwesomeIcons.circleQuestion),
              SizedBox(width: width * 0.05),
              Text(
                examType,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(FontAwesomeIcons.clock),
              SizedBox(width: width * 0.05),
              Text(
                DateFormat('EEEE, dd MMMM').format(examDate),
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(FontAwesomeIcons.mapMarkerAlt),
              SizedBox(width: width * 0.05),
              Text(
                examLocation,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(FontAwesomeIcons.percentage),
              SizedBox(width: width * 0.05),
              Text(
                "$syllabusMark of the whole course",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
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
        result = 'Today at ${DateFormat('j').format(eventDate)} ';
      } else {
        result = 'Tomorrow at ${DateFormat('j').format(eventDate)} ';
      }
    } else if (difference.inDays > 0) {
      result = '${difference.inDays} days remaining ';
    } else {
      result = '${-difference.inDays} days ago ';
    }

    return result;
  }
}
