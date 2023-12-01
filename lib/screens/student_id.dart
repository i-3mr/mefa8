import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/widgets/studentId/student-id.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:nfc_manager/nfc_manager.dart';

class StudentIDScreen extends StatefulWidget {
  const StudentIDScreen({super.key});

  @override
  State<StudentIDScreen> createState() => _StudentIDScreenState();
}

class _StudentIDScreenState extends State<StudentIDScreen> {
  ValueNotifier<dynamic> result = ValueNotifier(null);
  double? init;
  @override
  void initState() {
    super.initState();
    setBrightness(1);
  }

  @override
  void dispose() {
    super.dispose();
    resetBrightness();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Student ID',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(Const.primaryGreen),
          // borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(Const.primaryGreen),
              Color(Const.darkGreen),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              child: Transform.scale(
                scale: 0.95,
                child: Transform.rotate(
                  angle: 0,
                  child: const StudentId(
                    name: "عبدالله محمد حجازي",
                    imageUrl:
                        "https://labeeb.masdr.sa/assets/images/WelcomeAvatar.png",
                    birthDate: "1998-01-01",
                    id: "202044800",
                    expireDate: '"2022 JAN"',
                    bloodType: "O+",
                    nationalId: "1234567890",
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> resetBrightness() async {
    try {
      await ScreenBrightness().resetScreenBrightness();
    } catch (e) {
      print(e);
      throw 'Failed to reset brightness';
    }
  }

  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      // log(tag.data.toString());
      // log(tag.toString());
      NfcManager.instance.stopSession();
    });
  }

  Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      print(e);
      throw 'Failed to set brightness';
    }
  }

  void addContact(Contact contact) async {
    // log("message !!");
  }

  void _ndefWrite() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        result.value = 'Tag is not ndef writable';
        NfcManager.instance.stopSession(errorMessage: result.value);
        return;
      }

      NdefMessage message = NdefMessage([
        NdefRecord.createText('Hello World!'),
        NdefRecord.createUri(Uri.parse('https://flutter.dev')),
        NdefRecord.createMime(
            'text/plain', Uint8List.fromList('Hello'.codeUnits)),
        NdefRecord.createExternal(
            'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
      ]);

      try {
        await ndef.write(message);
        result.value = 'Success to "Ndef Write"';
        NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }
}

class Contact {
  final String name;
  final String phone;

  Contact({required this.name, required this.phone});

  Map<String, dynamic> toJson() => {'name': name, 'phone': phone};

  static Contact fromJson(Map<String, dynamic> json) =>
      Contact(name: json['name'], phone: json['phone']);
}
