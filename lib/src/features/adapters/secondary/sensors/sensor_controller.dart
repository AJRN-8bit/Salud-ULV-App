import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:salud_ulv_app/src/core/middleware/errors.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:salud_ulv_app/src/core/domain/userActivity/ports/outports.dart';

class SensorsPlusAdapter implements IBeginRegisterActivityOutPort {
  // StreamSubscription? _subscription;
  // final _controller = StreamController<double>.broadcast();

// StreamSubscription for accelerometer events
  // late StreamSubscription<UserAccelerometerEvent> _accelerometerSubscription;
  // UserAccelerometerEvent _accelerometerValues;
// late StreamSubscription<double> _distanceSub;

  double currentLatitude = 0.0;
  double currentLongitude = 0.0;

  @override
  Stream<List<double>> getAccelerometerSpeed() {
    return userAccelerometerEventStream().map((event) {
      return [
        event.x.abs(),
        event.y.abs(),
        event.z.abs(),
      ];
    },
    );
  }
  
  @override
  Stream<List<double>> getLocationStream() async* {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // LocationSettings settings;

    try {


      if (!serviceEnabled) {
        yield [0.0, 0.0, 0.0, 0.0, 0.0];
        debugPrint("Ubicacion no activada");
      }

      // 2. ¿Tenemos permisos?
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw ValidationError("Ubicacion no activada");
        }
      }
      
      if (permission == LocationPermission.deniedForever) {
        throw ValidationError("Ubicacion no activada");
      }



    //   if (Platform.isAndroid) {
    //   settings = AndroidSettings
    //   (
    //     accuracy: LocationAccuracy.high,
    //     distanceFilter: 0, // CRITICO: 0 para que no ignore movimientos pequeños
    //     intervalDuration: const Duration(seconds: 1), // Solicita datos cada segundo
    //     // Esto ayuda a que Android no mate el proceso en debug
    //     foregroundNotificationConfig: const ForegroundNotificationConfig(
    //       notificationText: "Registrando actividad...",
    //       notificationTitle: "GPS Activo",
    //       enableWakeLock: true,
    //     ),
    //   );

    // } else {
    //   settings = const LocationSettings(
    //     accuracy: LocationAccuracy.high,
    //     distanceFilter: 0,
    //   );
    // }





      yield* Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.best,
          distanceFilter: 1, // Amount of meters for the locator emit a signal
        ),
      ).map((Position position) {

        return [
          position.latitude,
          position.longitude,
          position.altitude,
          position.speed,
          // position.accuracy,
        ];
      });


    } catch (e) {
      debugPrint(e.toString());
      yield [0.0, 0.0, 0.0, 0.0, 0.0];
    }
}


 @override
  Future<double> getDistance(double lastPointLatitude, double lastPointLongitude , double currentPointLatitude, double currentPointLongitude) async {

    final distance  = Geolocator.distanceBetween(
      lastPointLatitude, 
      lastPointLongitude, 
      currentLatitude,
      currentLongitude
      );
    
    return distance.toDouble();
  }

//   @override
//   void stopSensor() {
//     _distanceSub.cancel();
//   }  
}



