// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';



// Future<Database> openDB() async {
  
//   // Obtiene la ruta de las bases de datos
//   final dbPath = await getDatabasesPath();
  
//   // Une la ruta con el nombre de la DB
//   final path = join(dbPath, 'SaludULVTest.db');

//   // Abre la DB, la crea si no existe
//   return await openDatabase(
//     path,
//     version: 1,
//     onCreate: (db, version) async {
//       // Ejemplo: crea tabla
//       await db.execute('''
//         CREATE TABLE userAnthropometrics(
//           registryID TEXT PRIMARY KEY not NULL,
//           userID INTEGER not NULL,
//           height REAL not NULL,
//           weight REAL not NULL,
//           smm REAL not NULL,
//           fat_mass REAL not NULL,
//           body_fat_percentage REAL not NULL,
//           bmi REAL not NULL,
//           whr REAL not NULL,
//           registryDate TEXT not NULL
//         )
//       ''');
//     },
//   );
// }