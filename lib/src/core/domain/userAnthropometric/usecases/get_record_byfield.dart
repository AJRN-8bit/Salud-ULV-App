
// import 'package:flutter/foundation.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/ports/inports.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/ports/outports.dart';
// import 'package:salud_ulv_app/src/core/middleware/errors.dart';

class GetAnthropometricsByFieldUseCase implements IGetAnthropometricsByFieldInPort{
  final IGetAnthropometricsOutPort _getAnthropometricsOutPort;

  const GetAnthropometricsByFieldUseCase(this._getAnthropometricsOutPort);

  @override
    Future<List<Map<String, dynamic>>> getRecordsByField(String field) async {
    
      final result = await _getAnthropometricsOutPort.getRecordsByField(field);      
      
      if(result.isEmpty){
        return [];
        // throw ValidationError("No hay registros antropometricos");
        }
      return result;
    }
}