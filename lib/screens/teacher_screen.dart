import 'package:flutter/material.dart';
import '../database_helper.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  Future<void> _resetData(BuildContext context) async {
    // Reset dictation answers
    await DatabaseHelper.instance.updateDictationAnswers(List.filled(10, '-'));
    // Generate new word set (handled in other screens)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
        backgroundColor: const Color(0xFF17A2B8),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Section 1: Enhance Listening
              _buildSection(
                title: 'ENHANCE LISTENING',
                description:
                'In this section, you will have to add words for enhancing the LISTENING ability of the kids. Make sure that the words are a mix of easy and hard.',
                onPressed: () async {
                  await _resetData(context);
                  Navigator.pushNamed(context, '/addinstruction');
                },
                buttonLabel: 'Add Dictation Words',
              ),
              const SizedBox(height: 20),

              // Section 2: Enhance Reading
              _buildSection(
                title: 'ENHANCE READING',
                description:
                'In this section, you will have to add words for enhancing the READING ability of the kids. Make sure that the words are a mix of easy and hard.',
                onPressed: () async {
                  await _resetData(context);
                  Navigator.pushNamed(context, '/addwords_2');
                },
                buttonLabel: 'Add Reading Set',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    required VoidCallback onPressed,
    required String buttonLabel,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF17A2B8),
              ),
            ),
            const SizedBox(height: 12),
            // Description
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            // Action Button
            ElevatedButton(
              onPressed: onPressed,
              child: Text(buttonLabel),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF17A2B8), // Replaced primary with backgroundColor
                foregroundColor: Colors.white, // Replaced onPrimary with foregroundColor
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
