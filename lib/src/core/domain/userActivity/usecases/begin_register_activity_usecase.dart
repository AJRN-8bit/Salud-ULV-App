
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:salud_ulv_app/src/core/domain/userActivity/models/user_activity.dart';
// import 'package:salud_ulv_app/src/core/domain/userActivity/models/user_activity.dart';
import 'package:salud_ulv_app/src/core/domain/userActivity/ports/inports.dart';
import 'package:salud_ulv_app/src/core/domain/userActivity/ports/outports.dart';


class BeginRegisterActivityUsecase implements IBeginActivityInPort {
  final IBeginRegisterActivityOutPort _iRegisterActivityOutPort;
  // final ISaveCacheActivityOutPort _isaveCacheActivityOutPort;
  // final ISensorsOutPort _iSensorsOutPort;

  // const BeginRegisterActivityUsecase(this._iRegisterActivityOutPort, this._isaveCacheActivityOutPort);
  const BeginRegisterActivityUsecase(this._iRegisterActivityOutPort);


  /* 
  This use case takes the data from the sensors.
  Show on the UI the steps, velocity, time, distance.
  This values and the altitude will be stored in the local db as a cache.
  */

  

  @override
  Stream<Map<String, dynamic>> beginActivity() async*{
    debugPrint("Inside activity registry use case");


    // Sensor activation
    // final acceleration = _iRegisterActivityOutPort.getAccelerometerSpeed();
    // final locationData = _iRegisterActivityOutPort.getLocationStream();

    Stopwatch stopwatch = Stopwatch();
    stopwatch.start();


    // Variables
    final int metersThreshold = 5;

    int stepCount = 0;
    double speed = 0.0;
    double distance = 0.0;
    double elevGain = 0.0;
    DateTime lastTimePoint = DateTime.now();
    RawUserActivity? lastPoint;

    yield {
          "distance": 0.0,
          "elevation": 0.0,
          "velocity": 0.0,
          "steps": 0,
          "elapsedTime": 0.0
        };  


    await for(final locationData in _iRegisterActivityOutPort.getLocationStream()){

      final now = DateTime.now();

      if(lastPoint == null)
      {
        lastPoint = RawUserActivity(
          latitude: locationData[0],
          longitude: locationData[1],
          altitude: locationData[2],
          speed: locationData[3],
          timePoint: now
        );

      lastTimePoint = now;
      continue;
      }




      final timeThreshold = now.difference(lastTimePoint).inSeconds >= metersThreshold;
      if(timeThreshold){

        final currentPoint = RawUserActivity(
          latitude: locationData[0],
          longitude: locationData[1],
          altitude: locationData[2],
          speed: locationData[3],
          timePoint: now
        );

        double deltaDistance = await _iRegisterActivityOutPort.getDistance(
          lastPoint.latitude!, 
          lastPoint.longitude!, 
          currentPoint.latitude!, 
          currentPoint.longitude!
        );

        if(deltaDistance >= 2){
          distance += deltaDistance;
        }

        double deltaElevation = currentPoint.altitude! - lastPoint.altitude!;

        if(deltaElevation > 0){elevGain += deltaElevation;}

        // if(currentPoint.speed => 0.5){ currentPoint.speed = 0;}

        debugPrint(currentPoint.toString());

        yield {
          "distance": distance,
          "elevation": elevGain,
          "velocity": currentPoint.speed,
          "steps": stepCount,
          "elapsedTime": stopwatch.elapsed.inSeconds,
        };  

        lastPoint = currentPoint;
        lastTimePoint = now;

      }





    // Calculates the steps based on accelerometer
    // It also checks if the phone is actually moving some meters
    // This takes out the "shake the phone" exploit
    // Can be more accurate
    // void stepCalculator(List<double> accData){
    //   final x = accData[0];
    //   final y = accData[1];
    //   final z = accData[2];
    //   final int stepCoolDownSeconds = 350;

    //   // Gavity already filtered in sensor controller
    //   final magnitude = sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2));

    //   final double avg = accData.reduce((a,b) => a + b) / accData.length;

    //   // final double dynamicThreshold = avg + 1.0;
    //   final double dynamicThreshold = avg + 4.0;
    //   // debugPrint('Dynamic threshold ${dynamicThreshold}');

    //   final now = DateTime.now();

    //   // Checks if the step cooldown is around 350 ms
    //   final bool stepCoolDown = now.difference(lastTimePoint).inMilliseconds > stepCoolDownSeconds;

    //   // Cheaks if the user has really moved
    //   final bool traveledMeters = distance >= 2;

    //   // Checks if magnitude is greater than the avg threshold, 
    //   // Checks if the step cooldown is has passed,
    //   // Checks if the phone has actually travelled some distance 
    //   if(magnitude > dynamicThreshold && stepCoolDown && traveledMeters){
    //     stepCount ++;
    //     lastTimePoint = now;
    //   }
    // }


    // // The sensors return m/s values, this is only a filter
    // void velocityCalculator(double vel){
    //   if(vel <= 0.5){
    //     velocity = 0;
    //   }
    //   else{
    //     velocity = vel;
    //   }
    // }

    }

  }

}