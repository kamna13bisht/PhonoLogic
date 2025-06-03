import 'package:flutter/material.dart';
import 'package:phonologic/screens/addwordsinst.dart';
import 'package:phonologic/screens/brainstorming.dart';
import 'package:phonologic/screens/instruction_listen.dart';
import 'package:phonologic/screens/instruction_read.dart';
import 'package:phonologic/screens/learning.dart';
import 'package:phonologic/screens/level_screen.dart';
import 'package:phonologic/screens/quiz.dart';
import 'package:phonologic/screens/whiteboard.dart';
import 'package:phonologic/screens/writing.dart';
import 'screens/home_screen.dart';
import 'screens/listen_screen.dart';
import 'screens/read_screen.dart';
import 'screens/student_screen.dart';
import 'screens/teacher_screen.dart';
import 'screens/addwords_screen.dart';

import 'screens/about_screen.dart';



void main() {
  runApp(const PhonologicApp());
}


class PhonologicApp extends StatelessWidget {
  const PhonologicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phonologic',
      theme: ThemeData(
        primaryColor: const Color(0xFF17A2B8),
        fontFamily: 'Comfortaa',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF33CACF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            textStyle: const TextStyle(
              fontSize: 11,
              letterSpacing: 2.5,
              fontWeight: FontWeight.w500,
            ),
            elevation: 8,
            shadowColor: Colors.black.withOpacity(0.1),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/listen': (context) => const ListenScreen(),
        '/read': (context) => const ReadScreen(),
        '/student': (context) => const StudentScreen(),
        '/teacher': (context) => const TeacherScreen(),
        '/addwords': (context) => const AddWordsScreen(),
        //'/result': (context) => const ResultScreen(type: 'dictation'),
        '/level': (context) => const LevelScreen(),
        '/about': (context) => const AboutScreen(),
        '/instlisten': (context) => const InstructionListen(),
        '/instread': (context) => const InstructionRead(),
        '/addinstruction': (context) => const AddwordInstruction(),
        '/quiz': (context) => QuizScreen(
          level: ModalRoute.of(context)!.settings.arguments as String,
        ),
        '/brainstorming': (context) => const BrainStorming(),
        '/learning': (context) => const Learning(),
        '/writing': (context) => const Writing(),
        '/whiteboard': (context) => WhiteboardScreen()
      },
    );
  }
}