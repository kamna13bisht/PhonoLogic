import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../database_helper.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  Future<void> _resetData(BuildContext context) async {
    await DatabaseHelper.instance.updateDictationAnswers(List.filled(10, '-'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student'),
        backgroundColor: const Color(0xFF17A2B8),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSection(
                context,
                title: 'LISTEN',
                description:
                'You will get 10 words. You will listen to them and try to spell them correctly.',
                buttonText: 'Dictation Exercise',
                onPressed: () async {
                  await _resetData(context);
                  Navigator.pushNamed(context, '/instlisten');
                },
              ),
              const SizedBox(height: 20),
              // _buildSection(
              //   context,
              //   title: 'TUTORIAL',
              //   description:
              //   'Learn many words, their meanings, and their pronunciations.',
              //   buttonText: 'Tutorial',
              //   onPressed: () async {
              //     await _resetData(context);
              //     Navigator.pushNamed(context, '/listen');
              //   },
              // ),
              // const SizedBox(height: 20),
              _buildSection(
                context,
                title: 'READ',
                description:
                'You will see 10 handwritten words as an image. Look at them and try to spell them correctly.',
                buttonText: 'Reading Exercise',
                onPressed: () async {
                  await _resetData(context);
                  Navigator.pushNamed(context, '/instread');
                },
              ),
              const SizedBox(height: 20),
              _buildSection(
                context,
                title: 'QUIZZES',
                description:
                'Test your knowledge! Choose a level: Beginner, Intermediate, or Advanced.',
                buttonText: 'Select Level',
                onPressed: () {
                  Navigator.pushNamed(context, '/level');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
      BuildContext context, {
        required String title,
        required String description,
        required String buttonText,
        required VoidCallback onPressed,
      }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
        child: Column(
          children: [
            Text(
              title,
              style: GoogleFonts.comfortaa(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: GoogleFonts.comfortaa(fontSize: 16),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF17A2B8),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
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
