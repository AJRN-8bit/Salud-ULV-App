
import 'package:salud_ulv_app/src/core/domain/userActivity/models/user_activity.dart';

// Use of the sensors
abstract class IBeginRegisterActivityOutPort{
  //   // Gets distance
  // Future<void> getDuration();  // Gets duration
  // Future<void> getCadence();  // Gets cadence
  Stream<List<double>> getAccelerometerSpeed();  // Gets acceleration speed\
  Stream<List<double>> getLocationStream();
  Future<double> getDistance(double firstLatitude, double firstLongitude, double lastLatitude, double lastLongitude);
  // Future<void> getElevation();  // Gets elevation
  // Future<void> getSteps();  // Gets steps
  // void stopSensor(); // Stops the sensors
}

abstract class ISaveCacheActivityOutPort{
  Future<void> saveCache(RawUserActivity data);
}

abstract class IEndRegisterActivityOutPort{
    Future<void> saveActivity(UserActivity data);
}