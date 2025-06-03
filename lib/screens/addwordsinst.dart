import 'package:flutter/material.dart';

class AddwordInstruction extends StatelessWidget {
  const AddwordInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded,
              color: Color(0xFF4A4A4A)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF0E9FF), Color(0xFFE0F3FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with teacher icon
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD4E7FF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.school_rounded,
                        size: 36,
                        color: Color(0xFF5A7DDE),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        'Help Students Master\nTricky Words',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito',
                          color: Color(0xFF424242),
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your expertise helps create better learning materials',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF6B6B6B),
                    fontFamily: 'Nunito',
                  ),
                ),
                const SizedBox(height: 32),

                // Instruction Card
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white.withOpacity(0.4),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Introduction Section
                      _buildSectionHeader(
                        icon: Icons.lightbulb_outline_rounded,
                        title: "Your Contribution",
                        color: const Color(0xFF7B68EE),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'By adding words that students commonly struggle with, you\'re helping create targeted practice materials that make learning more effective.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.6,
                          color: Color(0xFF555555),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Steps Section
                      _buildSectionHeader(
                        icon: Icons.list_alt_rounded,
                        title: "Simple Steps",
                        color: const Color(0xFF4FB3E8),
                      ),
                      const SizedBox(height: 16),
                      _buildStep(
                        number: 1,
                        title: "Enter Challenging Words",
                        description: "Add words that students frequently misspell",
                        iconColor: const Color(0xFF7B68EE),
                      ),
                      _buildStep(
                        number: 2,
                        title: "Complete All Fields",
                        description: "Fill all 10 text fields with different words",
                        iconColor: const Color(0xFF4FB3E8),
                      ),
                      _buildStep(
                        number: 3,
                        title: "Submit Your List",
                        description: "We'll convert them to practice materials",
                        iconColor: const Color(0xFFF06B95),
                      ),
                      const SizedBox(height: 16),
                      const Divider(color: Color(0xFFE0E0E0)),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDF5FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.tips_and_updates_outlined,
                                color: Color(0xFF5A7DDE), size: 20),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Think about recent lessons - which words caused the most difficulty?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF5A5A5A),
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Proceed Button
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/addwords');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: const Color(0xFF8CC0FF),
                        foregroundColor: const Color(0xFF2E2E2E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        shadowColor: Colors.black.withOpacity(0.1),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Begin Adding Words',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_rounded, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: color,
            fontFamily: 'Nunito',
          ),
        ),
      ],
    );
  }

  Widget _buildStep({
    required int number,
    required String title,
    required String description,
    required Color iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 26,
            height: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$number',
              style: TextStyle(
                color: iconColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xFF444444),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}