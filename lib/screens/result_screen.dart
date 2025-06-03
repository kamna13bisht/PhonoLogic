import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final List<Map<String, String>> results;

  const ResultsScreen({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    final int correctCount =
        results.where((r) => r['isCorrect'] == 'true').length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Results'),
        backgroundColor: const Color(0xFF17A2B8),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: const Color(0xFF17A2B8),
            child: Column(
              children: [
                const Text(
                  'Summary',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '$correctCount / ${results.length} correct',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: results.length,
              itemBuilder: (context, index) {
                final result = results[index];
                final isCorrect = result['isCorrect'] == 'true';

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: isCorrect ? Colors.green[50] : Colors.red[50],
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isCorrect ? Colors.green : Colors.red,
                      child: Icon(
                        isCorrect ? Icons.check : Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Your Answer: ${result['userAnswer']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    subtitle: Text('Correct Word: ${result['correctWord']}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}