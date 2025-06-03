import 'package:flutter/material.dart';

class InstructionRead extends StatelessWidget {
  const InstructionRead({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.only(bottom: 24),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Be a master of reading...',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('assets/images/quiz.jpeg'),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Hello Student,',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'We guess you all are bored of studying the usual way. So, we have made something for you. '
                        'Let\'s see what you gotta do. In this section, you\'ll learn new words in a fun and engaging way.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Here are the steps:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '''
• Click on the PROCEED button.
• You will be taken to a new page. You will see an image on the left side with 10 words written, one on each line.
• On the right side, you'll find 10 text boxes. Each corresponds to a word in order. E.g., first word "Oil", second "Boy".
• Type the exact word from the image in the matching text box. Maintain the correct order.
• Pay attention to letter casing (capital or small letters).
• Do not switch pages until you finish writing all the words.
• After writing all 10 words, click the SUBMIT button.
• You’ll see which words were correct and which need practice.
• Review your mistakes and practice to become a master!''',
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),
                  const SizedBox(height: 28),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pushNamed(context, '/read'),
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('PROCEED'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        textStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
