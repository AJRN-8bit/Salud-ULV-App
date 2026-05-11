// import 'package:salud_ulv_app/src/core/domain/userAntrhopometric/usecases/register_anthrop.dart';
import '../models/user_anthropometric.dart';


abstract class IRegisterAnthropometricInPort{
  Future<void> registerAnthropometric(UserAnthropometric data);
}

abstract class IGetAnthropometricsInPort{
  Future<List<UserAnthropometric>> getAllRecords();
}

abstract class IGetRecentRecordInPort{
  Future<UserAnthropometric> getRecentRecord();
}

abstract class IGetAnthropometricsByFieldInPort{
  Future<List<Map<String,dynamic>>> getRecordsByField(String field);
}

