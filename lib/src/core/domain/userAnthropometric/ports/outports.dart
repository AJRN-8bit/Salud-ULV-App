import '../models/user_anthropometric.dart';

abstract class IRegisterAnthropometricOutPort {
  Future<void> saveData(UserAnthropometric data);
}

abstract class IGetAnthropometricsOutPort{
    Future<List<UserAnthropometric>> getAllRecords();
    Future<UserAnthropometric> getRecentAnthropometric();
    Future<List<Map<String,dynamic>>> getRecordsByField(String field);
}