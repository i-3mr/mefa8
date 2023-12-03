import 'package:flutter/material.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/widgets/blur.dart';
import 'package:mefa8/widgets/exams/exam_card.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'مواعيد الأختبارات',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: BlurBackGround(
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ExamCard(
                  courseName: 'COE',
                  courseCode: 301,
                  examType: 'Quiz',
                  examDate: DateTime(2023, 12, 21),
                  examLocation: 'Exam Location',
                  syllabusMark: 0.3,
                ),
                ExamCard(
                  courseName: 'SWE',
                  courseCode: 316,
                  examType: 'Midterm',
                  examDate: DateTime(2023, 12, 21),
                  examLocation: 'المسلخ',
                  syllabusMark: 30,
                ),
                ExamCard(
                  courseName: 'Math',
                  courseCode: 208,
                  examType: 'Final',
                  examDate: DateTime(2023, 12, 21),
                  examLocation: 'Exam Location',
                  syllabusMark: 30,
                ),
                ExamCard(
                  courseName: 'COE',
                  courseCode: 292,
                  examType: 'Midterm',
                  examDate: DateTime(2023, 12, 21),
                  examLocation: 'Exam Location',
                  syllabusMark: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
