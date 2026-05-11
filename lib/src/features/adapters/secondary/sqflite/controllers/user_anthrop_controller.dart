
import 'package:flutter/material.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/models/user_anthropometric.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/ports/outports.dart';
import 'package:salud_ulv_app/src/core/middleware/errors.dart';
import 'package:salud_ulv_app/src/features/adapters/secondary/sqflite/mappers/user_anthropometric_mapper.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



class DatabaseHelper {

  DatabaseHelper._instance();
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;

  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initializeDatabase();
    return _database;
  }

  Future<Database> _initializeDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'SaludULVTest.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
   await db.execute('''
        CREATE TABLE userAnthropometrics(
          registryID TEXT PRIMARY KEY not NULL,
          userID INTEGER not NULL,
          height REAL not NULL,
          weight REAL not NULL,
          smm REAL not NULL,
          fatMass REAL not NULL,
          bodyFatPercentage REAL not NULL,
          bmi REAL not NULL,
          whr REAL not NULL,
          registryDate TEXT not NULL
        )
      '''
    );
  }
}



class RegisterAnthtopometricsSQFLOutAdapter implements IRegisterAnthropometricOutPort{
  @override
  Future<void> saveData(UserAnthropometric data) async{
    try{
      debugPrint('Inside out adapter to sqflite -->');
      final db = await DatabaseHelper.instance.db;
      
      if(db != null){
        await db.insert('userAnthropometrics', UserAnthropometricMapper.allToMap(data));
      }
    } catch(e) {
        throw DatabaseError("Error al guardar datos");
    }
  }
}


class GetAnthropometricsSQFLOutAdapter implements IGetAnthropometricsOutPort{

  @override
  Future<List<UserAnthropometric>> getAllRecords() async {
    try {
      final db = await DatabaseHelper.instance.db;

      if(db != null){
        final List<Map<String, dynamic>> result =  await db.query('userAnthropometrics', orderBy: 'registryDate DESC');
        return result.map((row) => UserAnthropometricMapper.allFromMap(row)).toList();
      }  
      else{ return [];}
    } catch (e) {
      throw DatabaseError("Error al leer los datos");
    }
  }


  @override
  Future<UserAnthropometric> getRecentAnthropometric() async {
    try {
      final db = await DatabaseHelper.instance.db;

      if(db == null){
        return UserAnthropometric();
      }  
        final List<Map<String, dynamic>> result =  await db.query('userAnthropometrics', orderBy: 'registryDate DESC', limit: 1);
        if(result.isEmpty){return UserAnthropometric();}

        return UserAnthropometricMapper.allFromMap(result.first);
      
    } catch (e) {
      throw DatabaseError("Error al leer los datos");
    }
  }


  @override
  Future<List<Map<String,dynamic>>> getRecordsByField(String field) async {
    try {
      final db = await DatabaseHelper.instance.db;

      if(db != null){
        // Return record older to newer order
        final List<Map<String,dynamic>> result =  await db.query('userAnthropometrics', columns: [field, 'registryDate'], orderBy: 'registryDate ASC');
        return result;
      }  
      else{ return []; }
      
    } catch (e) {
      throw DatabaseError("Error al leer los datos");
    }
  }
}