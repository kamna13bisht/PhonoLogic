import 'package:flutter/material.dart';

import 'result_screen.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  final List<TextEditingController> _controllers =
  List.generate(10, (_) => TextEditingController());

  final List<String> _correctWords = [
    'apple',
    'ball',
    'cat',
    'dog',
    'eye',
    'fan',
    'goal',
    'hat',
    'ink',
    'jug',
  ];


  final String _imagePath = 'assets/images/read1.jpeg';
  List<bool> _isCorrect = List.filled(10, false);

  void _submit() {
    List<Map<String, String>> results = [];
    List<bool> correctList = [];

    for (int i = 0; i < _correctWords.length; i++) {
      String userAnswer = _controllers[i].text.trim().toLowerCase();
      bool isCorrect = userAnswer == _correctWords[i].toLowerCase();
      correctList.add(isCorrect);

      results.add({
        'userAnswer': userAnswer,
        'correctWord': _correctWords[i],
        'isCorrect': isCorrect.toString(),
      });
    }

    setState(() {
      _isCorrect = correctList;
    });

    // Navigate to results screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(results: results),
      ),
    );
  }

  void _resetExercise() {
    setState(() {
      for (var controller in _controllers) {
        controller.clear();
      }
      _isCorrect = List.filled(10, false);
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading Practice'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  'Read and Write',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    _imagePath,
                    width: MediaQuery.of(context).size.width * 0.75,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image, size: 150),
                  ),
                ),
                const SizedBox(height: 24),
                ...List.generate(10, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextField(
                      controller: _controllers[index],
                      decoration: InputDecoration(
                        labelText: 'Word ${index + 1}',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        suffixIcon: _isCorrect[index]
                            ? const Icon(Icons.check, color: Colors.green)
                            : null,
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _resetExercise,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reset'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 14),
                        textStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: _submit,
                      icon: const Icon(Icons.check),
                      label: const Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 14),
                        textStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
