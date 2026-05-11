

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:salud_ulv_app/src/core/domain/userActivity/models/user_activity.dart';
// import 'package:salud_ulv_app/src/core/domain/userActivity/models/user_activity.dart';
import 'package:salud_ulv_app/src/core/domain/userActivity/ports/inports.dart';
import 'package:salud_ulv_app/src/core/domain/userActivity/ports/outports.dart';


class BeginWalking implements IBeginActivityInPort {
  final IBeginRegisterActivityOutPort _iRegisterActivityOutPort;
  // final ISaveCacheActivityOutPort _isaveCacheActivityOutPort;
  // final ISensorsOutPort _iSensorsOutPort;

  // const BeginRegisterActivityUsecase(this._iRegisterActivityOutPort, this._isaveCacheActivityOutPort);
  const BeginWalking(this._iRegisterActivityOutPort);


  /* 
  This use case takes the data from the sensors.
  Show on the UI the steps, velocity, time, distance.
  This values and the altitude will be stored in the local db as a cache.
  */

  

  @override
  Stream<Map<String, dynamic>> beginActivity() async*{
    debugPrint("Inside activity registry use case");


    // final int metersThreshold = 5;
    Stopwatch stopwatch = Stopwatch()..start();

    int stepCount = 0;
    double speed = 0.0;
    double alpha = 0.8;
    double lastMagnitude = 0.0;
    // double distance = 0.0;
    // double elevGain = 0.0;
    DateTime lastTimePoint = DateTime.now();
    // RawUserActivity? lastPoint;


    final acceleration = _iRegisterActivityOutPort.getAccelerometerSpeed();

    await for(final accData in acceleration){


    // Calculates the steps based on accelerometer
    //     It also checks if the phone is actually moving some meters
    //     This takes out the "shake the phone" exploit
    //     Can be more accurate
    final x = accData[0];
    final y = accData[1];
    final z = accData[2];
    final int stepCoolDownSeconds = 350;  // sacar promedio de caminata

    // Gavity already filtered in sensor controller
    final magnitude = sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2));

    lastMagnitude = alpha * lastMagnitude + (1-alpha) * magnitude;

    // speed = x + y + z;

    final double avg = accData.reduce((a,b) => a + b) / accData.length;

    // final double dynamicThreshold = avg + 1.0;
    final double dynamicThreshold = avg + 3.0;
    // debugPrint('Dynamic threshold ${dynamicThreshold}');

    final now = DateTime.now();

    // Checks if the step cooldown is around 350 ms
    final bool stepCoolDown = now.difference(lastTimePoint).inMilliseconds > stepCoolDownSeconds;

    // Cheaks if the user has really moved
    // final bool traveledMeters = distance >= 2;

    // Checks if magnitude is greater than the avg threshold, 
    // Checks if the step cooldown is has passed,
    // Checks if the phone has actually travelled some distance 
    if(lastMagnitude > dynamicThreshold && stepCoolDown){
      stepCount ++;
      lastTimePoint = now;
    }

    // if(speed <= 0.5){speed = 0;}


      yield{
        "steps": stepCount,
        // "speed": speed
        // "time": '${stopwatch.elapsed.inHours}:${stopwatch.elapsed.inMinutes}:${stopwatch.elapsed.inSeconds.toString().padLeft(2, '0')}'
        "time": stopwatch.elapsed
      };
    }
  }
}
