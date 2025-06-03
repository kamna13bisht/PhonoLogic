import 'package:flutter/material.dart';
import '../database_helper.dart';

class AddWordsScreen extends StatefulWidget {
  const AddWordsScreen({super.key});

  @override
  _AddWordsScreenState createState() => _AddWordsScreenState();
}

class _AddWordsScreenState extends State<AddWordsScreen> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _resetData() async {
    await DatabaseHelper.instance.updateDictationAnswers(List.filled(10, '-'));
  }

  void _submitWords() async {
    if (_formKey.currentState!.validate()) {
      final input = _controller.text.trim();
      final words = input.split(';').map((word) => word.trim()).where((word) => word.isNotEmpty).toList();
      await DatabaseHelper.instance.addWords(words);
      await _resetData();
      Navigator.pushNamed(context, '/result2');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Words'),
        backgroundColor: const Color(0xFF17A2B8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add New Words',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter words separated by semicolons (e.g., apple;banana;cat)',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Words',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter at least one word';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitWords,
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}