import 'dart:math';
import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  final String level;

  const QuizScreen({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _getLevelColor(level).withOpacity(0.8),
              _getLevelColor(level).withOpacity(0.4),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildAppBar(context),
                const SizedBox(height: 16),
                Expanded(
                  child: Quiz(level: level),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        Expanded(
          child: Text(
            '$level Quiz',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 48), // For balance
      ],
    );
  }

  Color _getLevelColor(String level) {
    switch (level) {
      case 'Beginner':
        return const Color(0xFF4CAF50); // Green
      case 'Intermediate':
        return const Color(0xFF2196F3); // Blue
      case 'Advanced':
        return const Color(0xFF9C27B0); // Purple
      default:
        return const Color(0xFF4CAF50);
    }
  }
}

class Quiz extends StatefulWidget {
  final String level;

  const Quiz({Key? key, required this.level}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> with SingleTickerProviderStateMixin {
  // Define question pools for each level
  final List<Map<String, Object>> beginnerQuestions = [
    {
      'questionText': 'Which letter is missing? _A, B, _, D',
      'answers': [
        {'text': 'C', 'score': 10},
        {'text': 'E', 'score': -2},
        {'text': 'F', 'score': -2},
      ],
    },
    {
      'questionText': 'Which letter makes the sound “sss”?',
      'answers': [
        {'text': 'S', 'score': 10},
        {'text': 'B', 'score': -2},
        {'text': 'T', 'score': -2},
      ],
    },
    {
      'questionText': 'Which one is a vowel?',
      'answers': [
        {'text': 'B', 'score': -2},
        {'text': 'A', 'score': 10},
        {'text': 'G', 'score': -2},
      ],
    },
    {
      'questionText': 'Pick the word that starts with “B”.',
      'answers': [
        {'text': 'Cat', 'score': -2},
        {'text': 'Ball', 'score': 10},
        {'text': 'Apple', 'score': -2},
      ],
    },
    {
      'questionText': 'Which picture shows an “apple”?',
      'answers': [
        {'text': '🍎', 'score': 10},
        {'text': '🐱', 'score': -2},
        {'text': '🚗', 'score': -2},
      ],
    },
    {
      'questionText': 'Find the rhyming word for “hat”.',
      'answers': [
        {'text': 'Mat', 'score': 10},
        {'text': 'Dog', 'score': -2},
        {'text': 'Pen', 'score': -2},
      ],
    },
    {
      'questionText': 'What letter does “dog” start with?',
      'answers': [
        {'text': 'D', 'score': 10},
        {'text': 'O', 'score': -2},
        {'text': 'G', 'score': -2},
      ],
    },
    {
      'questionText': 'Which of these is a real word?',
      'answers': [
        {'text': 'Blop', 'score': -2},
        {'text': 'Top', 'score': 10},
        {'text': 'Mib', 'score': -2},
      ],
    },
    {
      'questionText': 'Tap the word that means something you drink.',
      'answers': [
        {'text': 'Milk', 'score': 10},
        {'text': 'Fish', 'score': -2},
        {'text': 'Book', 'score': -2},
      ],
    },
    {
      'questionText': 'Which word has the same beginning sound as “sun”?',
      'answers': [
        {'text': 'Soap', 'score': 10},
        {'text': 'Car', 'score': -2},
        {'text': 'Apple', 'score': -2},
      ],
    },
    {
      'questionText': 'Spell the word “cat” by choosing letters.',
      'answers': [
        {'text': 'C-A-T', 'score': 10},
        {'text': 'A-C-T', 'score': -2},
        {'text': 'B-C-T', 'score': -2},
      ],
    },
    {
      'questionText': 'What sound does the letter “M” make?',
      'answers': [
        {'text': 'M', 'score': 10},
        {'text': 'T', 'score': -2},
        {'text': 'L', 'score': -2},
      ],
    },
    {
      'questionText': 'Which one of these is a color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Bed', 'score': -2},
        {'text': 'Led', 'score': -2},
      ],
    },
    {
      'questionText': 'Choose the correct word for the picture. (Cat)',
      'answers': [
        {'text': 'Dog', 'score': -2},
        {'text': 'Hat', 'score': -2},
        {'text': 'Cat', 'score': 10},
      ],
    },
    {
      'questionText': 'Find the word that ends with “g”.',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Pan', 'score': -2},
        {'text': 'Sit', 'score': -2},
      ],
    },
  ];

  final List<Map<String, Object>> intermediateQuestions = [
    {
      'questionText': 'Which word is a noun (name of a thing)?',
      'answers': [
        {'text': 'Run', 'score': -2},
        {'text': 'Happy', 'score': -2},
        {'text': 'Chair', 'score': 10},
      ],
    },
    {
      'questionText': 'Which word is spelled correctly?',
      'answers': [
        {'text': 'Frend', 'score': -2},
        {'text': 'Friend', 'score': 10},
        {'text': 'Freind', 'score': -2},
      ],
    },
    {
      'questionText': 'Choose the word that rhymes with “light”.',
      'answers': [
        {'text': 'Night', 'score': 10},
        {'text': 'Leaf', 'score': -2},
        {'text': 'Net', 'score': -2},
      ],
    },
    {
      'questionText': 'How many syllables are in the word “banana”?',
      'answers': [
        {'text': '1', 'score': -2},
        {'text': '2', 'score': -2},
        {'text': '3', 'score': 10},
      ],
    },
    {
      'questionText': 'Find the plural form of the word “box”.',
      'answers': [
        {'text': 'Boxs', 'score': -2},
        {'text': 'Boxes', 'score': 10},
        {'text': 'Boxies', 'score': -2},
      ],
    },
    {
      'questionText': 'Which word has a silent letter?',
      'answers': [
        {'text': 'Knee', 'score': 10},
        {'text': 'Cat', 'score': -2},
        {'text': 'Dog', 'score': -2},
      ],
    },
    {
      'questionText': 'Which of these words has a long “e” sound?',
      'answers': [
        {'text': 'Tree', 'score': 10},
        {'text': 'Bed', 'score': -2},
        {'text': 'Ten', 'score': -2},
      ],
    },
    {
      'questionText': 'Choose the correct word to complete the sentence: She is reading a ___ book.',
      'answers': [
        {'text': 'red', 'score': 10},
        {'text': 'read', 'score': -2},
        {'text': 'ride', 'score': -2},
      ],
    },
    {
      'questionText': 'Pick the word that means the opposite of “big”.',
      'answers': [
        {'text': 'Tall', 'score': -2},
        {'text': 'Small', 'score': 10},
        {'text': 'Huge', 'score': -2},
      ],
    },
    {
      'questionText': 'Which word has the same beginning blend as “blue”?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Table', 'score': -2},
        {'text': 'Green', 'score': -2},
      ],
    },
    {
      'questionText': 'Which sentence is correct?',
      'answers': [
        {'text': 'He go to school.', 'score': -2},
        {'text': 'He goes to school.', 'score': 10},
        {'text': 'He going to school.', 'score': -2},
      ],
    },
    {
      'questionText': 'Which of these is a describing word (adjective)?',
      'answers': [
        {'text': 'Jump', 'score': -2},
        {'text': 'Fast', 'score': 10},
        {'text': 'Run', 'score': -2},
      ],
    },
    {
      'questionText': 'Unscramble the letters to make a word: R A T S',
      'answers': [
        {'text': 'Rats', 'score': -2},
        {'text': 'Star', 'score': 10},
        {'text': 'Arts', 'score': -2},
      ],
    },
    {
      'questionText': 'Which word has the same ending sound as “cat”?',
      'answers': [
        {'text': 'Rat', 'score': 10},
        {'text': 'Cap', 'score': -2},
        {'text': 'Can', 'score': -2},
      ],
    },
    {
      'questionText': 'Choose the correct homophone: We went to the ___ to buy fruit.',
      'answers': [
        {'text': 'pair', 'score': -2},
        {'text': 'pear', 'score': 10},
        {'text': 'pare', 'score': -2},
      ],
    },
  ];

  final List<Map<String, Object>> advancedQuestions = [
    {
      'questionText': 'Which word is spelled correctly?',
      'answers': [
        {'text': 'Excercise', 'score': -2},
        {'text': 'Exercise', 'score': 10},
        {'text': 'Exersize', 'score': -2},
      ],
    },
    {
      'questionText': 'What does the prefix “un-” mean in the word “unhappy”?',
      'answers': [
        {'text': 'Very', 'score': -2},
        {'text': 'Not', 'score': 10},
        {'text': 'Again', 'score': -2},
      ],
    },
    {
      'questionText': 'Choose the word that best completes the sentence: The magician made the rabbit ___ from the hat.',
      'answers': [
        {'text': 'Disappear', 'score': 10},
        {'text': 'Appeared', 'score': -2},
        {'text': 'Appear', 'score': -2},
      ],
    },
    {
      'questionText': 'What is the root word in “replayed”?',
      'answers': [
        {'text': 'Play', 'score': 10},
        {'text': 'Played', 'score': -2},
        {'text': 'Re', 'score': -2},
      ],
    },
    {
      'questionText': 'Which sentence uses a contraction correctly?',
      'answers': [
        {'text': 'She dont like cake.', 'score': -2},
        {'text': 'She doesn’t like cake.', 'score': 10},
        {'text': 'She not like cake.', 'score': -2},
      ],
    },
    {
      'questionText': 'Pick the correct homophone: The knight rode into the __.',
      'answers': [
        {'text': 'Night', 'score': 10},
        {'text': 'Knight', 'score': -2},
      ],
    },
    {
      'questionText': 'Which word means the same as “gigantic”?',
      'answers': [
        {'text': 'Tiny', 'score': -2},
        {'text': 'Huge', 'score': 10},
        {'text': 'Sad', 'score': -2},
      ],
    },
    {
      'questionText': 'Which of these words is an adverb?',
      'answers': [
        {'text': 'Quickly', 'score': 10},
        {'text': 'Jump', 'score': -2},
        {'text': 'Car', 'score': -2},
      ],
    },
    {
      'questionText': 'Choose the word that has a soft “c” sound.',
      'answers': [
        {'text': 'Cat', 'score': -2},
        {'text': 'Circle', 'score': 10},
        {'text': 'Cup', 'score': -2},
      ],
    },
    {
      'questionText': 'Which sentence is written in the past tense?',
      'answers': [
        {'text': 'He walks to school.', 'score': -2},
        {'text': 'He walked to school.', 'score': 10},
        {'text': 'He walking to school.', 'score': -2},
      ],
    },
    {
      'questionText': 'Which suffix changes a word into a person who does something?',
      'answers': [
        {'text': '-ed', 'score': -2},
        {'text': '-ing', 'score': -2},
        {'text': '-er', 'score': 10},
      ],
    },
    {
      'questionText': 'Pick the compound word:',
      'answers': [
        {'text': 'Playground', 'score': 10},
        {'text': 'Happy', 'score': -2},
        {'text': 'Apple', 'score': -2},
      ],
    },
    {
      'questionText': 'Choose the correct sentence:',
      'answers': [
        {'text': 'Their going to the store.', 'score': -2},
        {'text': 'They’re going to the store.', 'score': 10},
        {'text': 'There going to the store.', 'score': -2},
      ],
    },
    {
      'questionText': 'What does the word “preview” mean?',
      'answers': [
        {'text': 'To see before', 'score': 10},
        {'text': 'To see again', 'score': -2},
        {'text': 'To see after', 'score': -2},
      ],
    },
    {
      'questionText': 'Which word has all the vowels in the correct order?',
      'answers': [
        {'text': 'Education', 'score': 10},
        {'text': 'Question', 'score': -2},
        {'text': 'Quiet', 'score': -2},
      ],
    },
  ];

  late AnimationController _animationController;
  late Animation<double> _animation;

  List<Map<String, Object>> _questions = [];
  var _questionIndex = 0;
  var _totalScore = 0;
  final Map<int, int?> _selectedAnswers = {};
  bool _showNextButton = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _selectRandomQuestions();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectRandomQuestions() {
    final random = Random();
    List<Map<String, Object>> questionPool;
    switch (widget.level) {
      case 'Beginner':
        questionPool = List.from(beginnerQuestions);
        break;
      case 'Intermediate':
        questionPool = List.from(intermediateQuestions);
        break;
      case 'Advanced':
        questionPool = List.from(advancedQuestions);
        break;
      default:
        questionPool = List.from(beginnerQuestions);
    }

    _questions = [];
    for (int i = 0; i < 5 && questionPool.isNotEmpty; i++) {
      final index = random.nextInt(questionPool.length);
      _questions.add(questionPool.removeAt(index));
    }

    _animationController.reset();
    _animationController.forward();
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _selectedAnswers.clear();
      _showNextButton = false;
      _selectRandomQuestions();
    });
  }

  void _answerQuestion(int score, int answerIndex) {
    if (_selectedAnswers[_questionIndex] == null) {
      setState(() {
        _totalScore += score;
        _selectedAnswers[_questionIndex] = answerIndex;
        _showNextButton = true;
      });
    }
  }

  void _nextQuestion() {
    _animationController.reset();
    setState(() {
      _questionIndex++;
      _showNextButton = false;
    });
    _animationController.forward();
  }

  Color _getLevelColor() {
    switch (widget.level) {
      case 'Beginner':
        return const Color(0xFF4CAF50);
      case 'Intermediate':
        return const Color(0xFF2196F3);
      case 'Advanced':
        return const Color(0xFF9C27B0);
      default:
        return const Color(0xFF4CAF50);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _questionIndex < _questions.length
        ? FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(_animation),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LinearProgressIndicator(
                  value: (_questionIndex + 1) / _questions.length,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _getLevelColor(),
                  ),
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(5),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Question ${_questionIndex + 1}/${_questions.length}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getLevelColor().withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.level,
                          style: TextStyle(
                            color: _getLevelColor(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Question(_questions[_questionIndex]['questionText'] as String),
                const SizedBox(height: 24),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: (_questions[_questionIndex]['answers']
                      as List<Map<String, Object>>)
                          .asMap()
                          .entries
                          .map((entry) {
                        final index = entry.key;
                        final answer = entry.value;
                        final isSelected =
                            _selectedAnswers[_questionIndex] != null;
                        final isCorrect = (answer['score'] as int) > 0;
                        final wasSelected =
                            _selectedAnswers[_questionIndex] == index;

                        Color? backgroundColor;
                        Color? borderColor;
                        Color? textColor;

                        if (isSelected) {
                          if (wasSelected) {
                            backgroundColor = isCorrect
                                ? Colors.green.withOpacity(0.1)
                                : Colors.red.withOpacity(0.1);
                            borderColor = isCorrect
                                ? Colors.green
                                : Colors.red;
                            textColor = isCorrect
                                ? Colors.green
                                : Colors.red;
                          } else if (isCorrect) {
                            backgroundColor =
                                Colors.green.withOpacity(0.1);
                            borderColor = Colors.green;
                            textColor = Colors.green;
                          }
                        }

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Answer(
                            answerText: answer['text'] as String,
                            onPressed: () =>
                                _answerQuestion(answer['score'] as int, index),
                            backgroundColor: backgroundColor,
                            borderColor: borderColor,
                            textColor: textColor,
                            isDisabled: isSelected,
                            wasSelected: wasSelected,
                            isCorrect: isCorrect,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                if (_showNextButton)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _getLevelColor(),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      onPressed: _nextQuestion,
                      child: const Text(
                        'Next Question',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    )
        : Result(
      totalScore: _totalScore,
      resetQuiz: _resetQuiz,
      maxScore: 50,
      levelColor: _getLevelColor(),
    );
  }
}

class Question extends StatelessWidget {
  final String questionText;

  const Question(this.questionText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        questionText,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          height: 1.4,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final String answerText;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final bool isDisabled;
  final bool wasSelected;
  final bool isCorrect;

  const Answer({
    Key? key,
    required this.answerText,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    required this.isDisabled,
    required this.wasSelected,
    required this.isCorrect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        border: Border.all(
          color: borderColor ?? Colors.grey[300]!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          if (!isDisabled)
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: isDisabled ? null : onPressed,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    answerText,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: wasSelected ? FontWeight.bold : FontWeight.normal,
                      color: textColor ?? Colors.black87,
                    ),
                  ),
                ),
                if (isDisabled && wasSelected)
                  Icon(
                    isCorrect ? Icons.check_circle : Icons.cancel,
                    color: isCorrect ? Colors.green : Colors.red,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {
  final int totalScore;
  final int maxScore;
  final VoidCallback resetQuiz;
  final Color levelColor;

  const Result({
    Key? key,
    required this.totalScore,
    required this.resetQuiz,
    required this.maxScore,
    required this.levelColor,
  }) : super(key: key);

  String get resultPhrase {
    final percentage = (totalScore / maxScore) * 100;

    if (percentage >= 80) {
      return 'Excellent! You aced this level!';
    } else if (percentage >= 60) {
      return 'Great job! You have a solid understanding.';
    } else if (percentage >= 40) {
      return 'Good effort! Keep practicing!';
    } else {
      return 'Keep learning! You\'ll get better!';
    }
  }

  @override
  Widget build(BuildContext context) {
    final percentage = (totalScore / maxScore) * 100;
    final theme = Theme.of(context);

    return FadeTransition(
      opacity: CurvedAnimation(
        parent: ModalRoute.of(context)!.animation!,
        curve: Curves.easeInOut,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Quiz Completed!',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: levelColor,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 180,
                          height: 180,
                          child: CircularProgressIndicator(
                            value: totalScore / maxScore,
                            strokeWidth: 12,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              levelColor,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              '${percentage.toInt()}%',
                              style: const TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$totalScore/$maxScore',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      resultPhrase,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: levelColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      onPressed: resetQuiz,
                      icon: const Icon(Icons.refresh),
                      label: const Text(
                        'Try Again',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Choose Another Level',
                        style: TextStyle(
                          color: levelColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}