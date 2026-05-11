

import 'package:salud_ulv_app/src/core/domain/userAnthropometric/models/user_anthropometric.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/ports/inports.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/ports/outports.dart';
// import 'package:salud_ulv_app/src/core/middleware/errors.dart';

class GetAllAnthropometricsUseCase implements IGetAnthropometricsInPort{
  final IGetAnthropometricsOutPort _getAnthropometricsOutPort;

  const GetAllAnthropometricsUseCase(this._getAnthropometricsOutPort);

  @override
    Future<List<UserAnthropometric>> getAllRecords() async {
    
      final result = await _getAnthropometricsOutPort.getAllRecords();
      
      if(result.isEmpty){return [];}
      return result;
    }
}