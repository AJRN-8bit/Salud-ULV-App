
import 'package:flutter/material.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/models/user_anthropometric.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/usecases/get_recent_record.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/usecases/get_record_byfield.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/usecases/getall_records_usecase.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/usecases/register_anthrop_usecase.dart';
import 'package:salud_ulv_app/src/core/middleware/errors.dart';
import 'package:salud_ulv_app/src/features/adapters/secondary/http/controllers/userAnthropometric/anthropdata_registry_controller.dart';
import 'package:salud_ulv_app/src/features/adapters/secondary/sqflite/controllers/user_anthrop_controller.dart';


class GetAnthropometricsByFieldInAdapter extends ChangeNotifier{

    GetAnthropometricsByFieldUseCase useCase = GetAnthropometricsByFieldUseCase(GetAnthropometricsSQFLOutAdapter());

    List<Map<String,dynamic>>? _data;
    String? _field;
    bool _isLoading = false;

    List<Map<String,dynamic>>? get data => _data;
    String? get field => _field;
    bool get isLoading => _isLoading;
    

     Future<void> execute(String field) async{
      _isLoading = true;
      notifyListeners();

      try {
        _data = await useCase.getRecordsByField(field);
        _field = field;

      } catch (e) {
        debugPrint(e.toString());
        throw ProcessError("Registro no obtenido");

      } finally {
        _isLoading = false;
        notifyListeners();
      }

     }
}



class GetAllAnthropometricsInAdapter extends ChangeNotifier{
  GetAllAnthropometricsUseCase useCase = GetAllAnthropometricsUseCase(GetAnthropometricsSQFLOutAdapter());

  List<UserAnthropometric>? _records;
  bool _isLoading = false;

  List<UserAnthropometric>? get records => _records;
  bool get isLoading => _isLoading;

  Future<void> execute() async{
    _isLoading = true;
    notifyListeners();

    try {
      _records = await useCase.getAllRecords();

      } catch (e) {
    debugPrint(e.toString());
    throw ProcessError("Registro no obtenido");

      } finally {
        _isLoading = false;
        notifyListeners();
      }
  }
}




class GetRecentAnthropometricInAdapter extends ChangeNotifier{

  GetRecentRecordUseCase useCase = GetRecentRecordUseCase(GetAnthropometricsSQFLOutAdapter());
  
  UserAnthropometric? _recentRecord;
  bool _isLoading = false;

  UserAnthropometric? get recentRecord => _recentRecord;
  bool get isLoading => _isLoading;


  Future<void> execute() async{
    _isLoading = true;
    notifyListeners();

    try {
      _recentRecord = await useCase.getRecentRecord();

    } catch (e) {
      debugPrint(e.toString());
      throw ProcessError("Registro no obtenido");

    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}


class RegisterAntrhopometricDataInAdapter extends ChangeNotifier{

  // RegisterAntrhopometricDataUseCase useCase = RegisterAntrhopometricDataUseCase(RegisterAnthropometricsHttpOutAdapter());
  GetRecentRecordUseCase recentData = GetRecentRecordUseCase(GetAnthropometricsSQFLOutAdapter());

  
  late UserAnthropometric _recentData;
  bool _isLoading = false;

  UserAnthropometric? get recentRecord => _recentData;
  bool get isLoading => _isLoading;


  Future<void> execute() async{
    _isLoading = true;
    notifyListeners();

    try {
       _recentData = await recentData.getRecentRecord();
      // await useCase.registerAnthropometric(_recentData);s

    } catch (e) {
      debugPrint(e.toString());
      throw ProcessError("Registro no obtenido");

    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}