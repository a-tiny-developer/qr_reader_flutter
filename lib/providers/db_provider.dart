import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/models.dart';

class DBProvider {
  static Database? _database;

  static Future<Database> database() async {
    if (_database != null && _database!.isOpen) {
      return _database!;
    }
    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    // path database
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'ScansDB.db');

    // create database
    return await openDatabase(
      path,
      version: 1,
      onOpen: (Database db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          )
          ''',
        );
      },
    );
  }

  static Future<int> newScanRaw(ScanModel newScan) async {
    // Check database
    final db = await database();
    final res = await db.rawInsert(
      '''b
      INSERT INTO Scans( id, type, value )
      VALUES( ${newScan.id}, '${newScan.type!.name}', '${newScan.value}' )
    ''',
    );
    return res;
  }

  static Future<int> newScan(ScanModel newScan) async {
    final db = await database();
    final res = await db.insert(
      'Scans',
      newScan.toMap(),
    );
    return res;
  }

  static Future<ScanModel?> getScanById(int id) async {
    final db = await database();
    final res = await db.query(
      'Scans',
      where: 'id = ?',
      whereArgs: [id],
    );
    return res.isNotEmpty ? ScanModel.fromMap(res.first) : null;
  }

  static Future<List<ScanModel>> getAllScans() async {
    final db = await database();
    final res = await db.query('Scans');
    return res.isNotEmpty ? res.map((e) => ScanModel.fromMap(e)).toList() : [];
  }

  static Future<List<ScanModel>> getScansByType(TypeScan type) async {
    final db = await database();
    final res = await db.rawQuery(
      '''
        SELECT * FROM Scans WHERE type = '${type.name}'
      ''',
    );
    return res.isNotEmpty ? res.map((e) => ScanModel.fromMap(e)).toList() : [];
  }

  Future<int> updateScan(ScanModel newScan) async {
    final db = await database();
    final res = await db.update(
      'Scans',
      newScan.toMap(),
      where: 'id = ?',
      whereArgs: [newScan.id],
    );
    return res;
  }

  static Future<int> deleteScan(int id) async {
    final db = await database();
    final res = await db.delete(
      'Scans',
      where: 'id = ?',
      whereArgs: [id],
    );
    return res;
  }

  static Future<int> deleteAllScan() async {
    final db = await database();
    final res = await db.rawDelete(
      '''
        DELETE FROM Scans
      ''',
    );
    return res;
  }
}
