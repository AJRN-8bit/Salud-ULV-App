
// import 'package:salud_ulv_app/src/core/domain/userActivity/models/user_activity.dart';

abstract class IBeginActivityInPort{
  Stream<Map<String, dynamic>> beginActivity(); // Begin the tracking, and show in screen.
}

abstract class IEndRegisterActivityInPort{
  
}