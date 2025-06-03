import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:math';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('phonologic.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, fileName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE words (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        word TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE dictation_answers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        answer TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE reading_sets (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image_path TEXT NOT NULL,
        words TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE reading_answers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        set_id INTEGER NOT NULL,
        answer TEXT NOT NULL
      )
    ''');
    // Initialize sample data
    await db.insert('words', {'word': 'apple'});
    await db.insert('words', {'word': 'banana'});
    await db.insert('words', {'word': 'cat'});
    for (int i = 0; i < 10; i++) {
      await db.insert('dictation_answers', {'answer': '-'});
    }
    await db.insert('reading_sets', {
      'name': 'read1',
      'image_path': 'assets/images/read1.jpeg',
      'words': 'dog;cat;bird;fish;lion;tiger;bear;wolf;fox;deer',
    });
  }

  Future<List<String>> getWords() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('words');
    return List.generate(maps.length, (i) => maps[i]['word']);
  }

  Future<List<String>> getDictationWords() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('words');
    final words = List.generate(maps.length, (i) => maps[i]['word'] as String);
    return words.take(10).toList();
  }

  Future<void> updateDictationAnswers(List<String> answers) async {
    final db = await database;
    await db.delete('dictation_answers');
    for (var answer in answers) {
      await db.insert('dictation_answers', {'answer': answer});
    }
  }

  Future<List<String>> getDictationAnswers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('dictation_answers');
    return List.generate(maps.length, (i) => maps[i]['answer']);
  }

  Future<void> addWords(List<String> words) async {
    final db = await database;
    for (var word in words) {
      await db.insert('words', {'word': word});
    }
  }

  Future<void> addReadingSet(String name, String imagePath, List<String> words) async {
    final db = await database;
    await db.insert('reading_sets', {
      'name': name,
      'image_path': imagePath,
      'words': words.join(';'),
    });
  }

  Future<Map<String, dynamic>?> getRandomReadingSet() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('reading_sets');
    if (maps.isEmpty) return null;
    return maps[Random().nextInt(maps.length)];
  }

  Future<void> updateReadingAnswers(int setId, List<String> answers) async {
    final db = await database;
    await db.delete('reading_answers', where: 'set_id = ?', whereArgs: [setId]);
    for (var answer in answers) {
      await db.insert('reading_answers', {'set_id': setId, 'answer': answer});
    }
  }

  Future<List<String>> getReadingAnswers(int setId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'reading_answers',
      where: 'set_id = ?',
      whereArgs: [setId],
    );
    return List.generate(maps.length, (i) => maps[i]['answer']);
  }

  Future<Map<String, dynamic>?> getReadingSetById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'reading_sets',
      where: 'id = ?',
      whereArgs: [id],
    );
    return maps.isNotEmpty ? maps.first : null;
  }
}