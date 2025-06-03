import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionListen extends StatelessWidget {
  const InstructionListen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffe4c4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF17A2B8),
        title: Text(
          "Instructions",
          style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'It\'s all easy peasy out here...',
                style: GoogleFonts.comfortaa(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/quiz.jpeg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Hello Student,',
                style: GoogleFonts.comfortaa(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'We guess you all are bored of studying the usual way. So, we made something exciting for you. Let\'s see what you gotta do!',
                style: GoogleFonts.comfortaa(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                'Follow these steps:',
                style: GoogleFonts.comfortaa(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildStepList(),
              const SizedBox(height: 30),
              Center(
                child: FloatingActionButton.extended(
                  backgroundColor: const Color(0xFF17A2a8),
                  onPressed: () {
                    Navigator.pushNamed(context, '/listen');
                  },
                  icon: const Icon(Icons.arrow_forward,color: Colors.black,),
                  label: Text(
                    'PROCEED',
                    style: GoogleFonts.comfortaa(fontWeight: FontWeight.w600,color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepList() {
    final steps = [
      'Click on the PROCEED button.',
      'You will see 10 RED buttons.',
      'Click any button and wait to hear a word.',
      'Remove the HYPHEN in the box and type the word you heard.',
      'Replay the word if needed.',
      'After typing all 10 words, click the SUBMIT button.',
      'You\'ll see your correct and incorrect answers.',
      'Practice repeatedly to master them!',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: steps
          .map(
            (step) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("• ", style: TextStyle(fontSize: 18)),
              Expanded(
                child: Text(
                  step,
                  style: GoogleFonts.comfortaa(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      )
          .toList(),
    );
  }
}
