import 'package:equatable/equatable.dart';

class UserAnthropometric extends Equatable{
  final String? registryID;
  final int? userID;
  final double? height;
  final double? weight;
  final double? smm;
  final double? fatMass;
  final double? bodyFatPercentage;
  final double? bmi;
  final double? whr;
  final DateTime? registryDate;

  const UserAnthropometric({
    this.registryID,
    this.userID,
    this.height,
    this.weight,
    this.smm,
    this.fatMass,
    this.bodyFatPercentage,
    this.bmi,
    this.whr,
    this.registryDate
  });

  @override
  List<Object?> get props {
    return
    [
      registryID,
      userID,
      height,
      weight,
      smm,
      fatMass,
      bodyFatPercentage,
      bmi,
      whr,
      registryDate
    ];
  }
}