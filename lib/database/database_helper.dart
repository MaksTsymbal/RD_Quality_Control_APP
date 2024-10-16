import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    // Створення таблиці для документів
    await db.execute('''
      CREATE TABLE documents (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        FOP TEXT,
        date TEXT,
        status INTEGER
      )
    ''');

    // Створення таблиці для користувачів
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        login TEXT,
        password TEXT,
        name TEXT
      )
    ''');
  }

  // Метод для додавання документа
  Future<void> insertDocument(Map<String, dynamic> document) async {
    final db = await instance.database;
    await db.insert('documents', document);
  }

  // Метод для отримання всіх документів
  Future<List<Map<String, dynamic>>> fetchDocuments() async {
    final db = await instance.database;
    return await db.query('documents');
  }

  // Метод для додавання користувача
  Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await instance.database;
    await db.insert('users', user);
  }

  // Метод для отримання всіх користувачів
  Future<List<Map<String, dynamic>>> fetchUsers() async {
    final db = await instance.database;
    return await db.query('users');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
