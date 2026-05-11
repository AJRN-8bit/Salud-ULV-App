

// import 'package:flutter/material.dart';
// import 'package:salud_ulv_app/src/core/domain/userActivity/models/user_activity.dart';
// import 'package:salud_ulv_app/src/core/domain/userActivity/ports/primary/activities_inports.dart';
// import 'package:salud_ulv_app/src/core/domain/userActivity/ports/secondary/activities_outports.dart';


// class RegisterActivityUsecase implements IBeginRegisterActivityInPort {
//   final IBeginRegisterActivityOutPort _iRegisterActivityOutPort;
//   final ISensorsOutPort _iSensorsOutPort;

//   const RegisterActivityUsecase(this._iRegisterActivityOutPort, this._iSensorsOutPort);

//   @override
//   Future<void> registerActivity(UserActivity data) async {
//     debugPrint("Inside activity registry use case");

//     // Sensor activation



//     final acceleration = await _iSensorsOutPort.getMovementSpeed();

    

//     await _iRegisterActivityOutPort.saveActivity(data);

//     // await _iUserRegistryOutputPort.saveActivity(data);
//     // aqui calcular el promedio de cadencia y velocidad
//     // aqui calcular la velocidad maxima
//     //

//   }
// }