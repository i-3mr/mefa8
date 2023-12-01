import 'package:flutter/material.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/widgets/exams/exam_card.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Exams',
            style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
      body: Container(
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
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          child: ExamCard(
              courseName: 'COE',
              courseCode: 301,
              examType: 'Quiz',
              examDate: DateTime(2024, 11, 21),
              examLocation: 'Exam Location',
              syllabusMark: 0.3),
        ),
      ),
    );
  }
}
