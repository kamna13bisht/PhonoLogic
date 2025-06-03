import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:phonologic/screens/result_screen.dart';



class ListenScreen extends StatefulWidget {
  const ListenScreen({super.key});

  @override
  _ListenScreenState createState() => _ListenScreenState();
}

class _ListenScreenState extends State<ListenScreen> {
  final List<TextEditingController> _controllers =
  List.generate(10, (_) => TextEditingController());

  final List<String> _words = [
    'apple', 'banana', 'cat', 'dog', 'elephant',
    'fish', 'giraffe', 'house', 'ice', 'jungle'
  ];

  final FlutterTts _flutterTts = FlutterTts();
  List<bool> _correctAnswers = List.filled(10, false);

  @override
  void initState() {
    super.initState();
    _initializeTts();
  }

  void _initializeTts() {
    _flutterTts.setLanguage('en-US');
    _flutterTts.setSpeechRate(0.5);
  }

  Future<void> _playWord(int index) async {
    if (index < _words.length) {
      await _flutterTts.speak(_words[index]);
    }
  }

  void _submit() {
    List<bool> correctList = [];
    List<Map<String, String>> results = [];

    for (int i = 0; i < _words.length; i++) {
      String userAnswer = _controllers[i].text.trim().toLowerCase();
      bool isCorrect = userAnswer == _words[i].toLowerCase();
      correctList.add(isCorrect);

      results.add({
        'userAnswer': userAnswer,
        'correctWord': _words[i],
        'isCorrect': isCorrect.toString(),
      });
    }

    setState(() {
      _correctAnswers = correctList;
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
      _correctAnswers = List.filled(10, false);
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictation Exercise'),
        backgroundColor: const Color(0xFF17A2B8),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Listen and type the word you hear.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...List.generate(_words.length, (index) {
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controllers[index],
                          decoration: InputDecoration(
                            labelText: 'Word ${index + 1}',
                            hintText: 'Type what you heard',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: _correctAnswers[index]
                                ? const Icon(Icons.check, color: Colors.green)
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        onPressed: () => _playWord(index),
                        icon: const Icon(Icons.volume_up_rounded),
                        color: Colors.teal,
                        tooltip: 'Play Word',
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _resetExercise,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 30,
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _submit,
                  icon: const Icon(Icons.check_circle),
                  label: const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF17A2B8),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 30,
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
