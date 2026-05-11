
import 'package:equatable/equatable.dart';

class UserActivity extends Equatable{
  final String? activityID;
  final int? userID;
  final String? activityType;
  final double? distance;
  final String? duration; // Because of time type
  final double? caloriesBurned;
  final double? avgCadence;
  final double? avgSpeed;
  final double? maxSpeed;
  final double? elevationGain;
  final double? steps;
  final DateTime? startDate;
  final DateTime? endDate;

  const UserActivity({
    this.activityID,
    this.userID,
    this.activityType, 
    this.distance,
    this.duration,
    this.caloriesBurned,
    this.avgCadence,
    this.avgSpeed,
    this.maxSpeed,
    this.elevationGain,
    this.steps,
    this.startDate,
    this.endDate 
  });

  @override
  List<Object?> get props {
    return
    [
      activityID,
      userID,
      activityType,
      distance,
      duration,
      caloriesBurned,
      avgCadence,
      avgSpeed,
      maxSpeed,
      elevationGain,
      steps,
      startDate,
      endDate
    ];
  }
}






class RawUserActivity extends Equatable{
  final double? latitude;
  final double? longitude;
  // final double? distance;
  final double? speed;
  final double? altitude;
  final DateTime? timePoint;

  const RawUserActivity({
     this.latitude, 
     this.longitude, 
    //  this.distance, 
     this.speed, 
     this.altitude, 
     this.timePoint
     });

     @override
  List<Object?> get props {
    return
    [
      latitude,
      longitude,
      speed,
      altitude,
      timePoint
    ];
  }

}