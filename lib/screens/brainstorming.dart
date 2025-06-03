import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrainStorming extends StatelessWidget {
  const BrainStorming({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0EAFC), Color(0xFFCFDEF3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/front_page.png',
                  width: width * 0.6,
                ),
                const SizedBox(height: 30),
                Text(
                  'Welcome!\nLet\'s get stronger!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 50),
                CustomButton(
                  icon: Icons.school,
                  label: 'Student',
                  onTap: () => Navigator.pushNamed(context, '/student'),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  icon: Icons.person,
                  label: 'Teacher',
                  onTap: () => Navigator.pushNamed(context, '/teacher'),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  icon: Icons.info_outline,
                  label: 'About',
                  onTap: () => Navigator.pushNamed(context, '/about'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const CustomButton({
    required this.label,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 22),
        label: Text(
          label,
          style: GoogleFonts.comfortaa(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
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
      ),
    );
  }
}
