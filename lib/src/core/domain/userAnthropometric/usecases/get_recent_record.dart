
// import 'package:flutter/material.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/models/user_anthropometric.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/ports/inports.dart';
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/ports/outports.dart';
// import 'package:salud_ulv_app/src/core/middleware/errors.dart';

class GetRecentRecordUseCase implements IGetRecentRecordInPort{
  final IGetAnthropometricsOutPort _getAnthropometricsOutPort;

  const GetRecentRecordUseCase(this._getAnthropometricsOutPort);

  @override
    Future<UserAnthropometric> getRecentRecord() async {
    
      final result = await _getAnthropometricsOutPort.getRecentAnthropometric();
      
      if(result == UserAnthropometric()){return UserAnthropometric();}
      return result;
    }
}