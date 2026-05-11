
import 'package:salud_ulv_app/src/core/domain/userAnthropometric/models/user_anthropometric.dart';

class UserAnthropometricMapper {

  static Map<String, dynamic> allToMap(UserAnthropometric data){
    return {
      'registryID': data.registryID,
      'userID': data.userID,
      'height': data.height,
      'weight': data.weight,
      'smm': data.smm,
      'fatMass': data.fatMass,
      'bodyFatPercentage': data.bodyFatPercentage,
      'bmi': data.bmi,
      'whr': data.whr,
      'registryDate': data.registryDate!.toIso8601String(),
    };
  }

  static UserAnthropometric allFromMap (Map<String, dynamic> map) {
    return UserAnthropometric(
      registryID: map['registryID'] as String,
      userID: map['userID'] as int,
      height: (map['height'] as num?)?.toDouble(),
      weight: (map['weight'] as num?)?.toDouble(),
      smm: (map['smm'] as num?)?.toDouble(),
      fatMass: (map['fatMass'] as num?)?.toDouble(),
      bodyFatPercentage: (map['bodyFatPercentage'] as num?)?.toDouble(),
      bmi: (map['bmi'] as num?)?.toDouble(),
      whr: (map['whr'] as num?)?.toDouble(),
      registryDate: DateTime.parse(map['registryDate'] as String)
    );
  }

//   static List<Map<String,dynamic>> dataFieldToMap(Map<String, dynamic> data, String field){
//     return data.values.map((item) => {
//         'valor': (item[field] as num).toDouble(),
//         'fecha': DateTime.parse(item['registryDate'] as String),
//       }).toList();
//   }
}