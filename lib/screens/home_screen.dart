import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8DD8E6), Color(0xFF8DD8E6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/front_page.png',
                width: width * 0.65,
              ),
              const SizedBox(height: 30),
              Text(
                'PhonoLogic \n Let\'s Learn Together',
                // 'Welcome!\nLet\'s get stronger!',
                textAlign: TextAlign.center,
                style: GoogleFonts.comfortaa(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 40),
              CustomButton(
                label: '🧠 Brain Storming',
                onTap: () => Navigator.pushNamed(context, '/brainstorming'),
              ),
              const SizedBox(height: 15),
              CustomButton(
                label: '📘 Learning',
                onTap: () => Navigator.pushNamed(context, '/learning'),
              ),
              const SizedBox(height: 15),
              CustomButton(
                label: '✍️ Writing',
                onTap: () => Navigator.pushNamed(context, '/whiteboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CustomButton({required this.label, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 6,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.comfortaa(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
