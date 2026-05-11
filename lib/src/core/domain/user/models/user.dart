
import 'package:equatable/equatable.dart';

abstract class IUser {
  int get userID;
  String get name;
  String get firstname;
  String get lastname;
  String get email;
  DateTime get birthDate;
  int get age;
  String get gender;
  DateTime get createdAt;
}



class User extends Equatable implements IUser {
  @override
  final int userID;
  @override
  final String name;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String email;

  final String password;
  @override
  final DateTime birthDate;
  @override
  final int age;
  @override
  final String gender;
  @override
  final DateTime createdAt;

  const User({
    required this.userID,
    required this.name,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.birthDate,
    required this.age,
    required this.gender,
    required this.createdAt
    });

    @override
    List<Object?> get props => [userID, name, firstname, lastname, email,
    birthDate, age, gender, createdAt];
}



// typedef IUserRegistry = ({
//   int userID,
//   String  email,
//   String password,
// });



abstract class IUserInfoRegistry {
  int get userID;
  String get name;
  String get firstname;
  String get lastname;
  DateTime get birthDate;
  int get age;
  String get gender;
}

abstract class IUserLogin{
  String get email;
  String get password;
}


//  // Validates the user input 
//         const validID = userID.toString().length <= 6 && /[0-9]/.test(userID.toString());
//         if(!validID){
//             throw new Error("Invalid user ID. It should be a number with a maximum of 6 digits.");
//         }

//         const pattern = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
//         const validEmail = pattern.test(email);
//         if(!validEmail){
//             throw new Error("Invalid email format.");
//         }

//         const validPassword = password.length >= 8 && /[a-zA-Z]/.test(password) && /[0-9]/.test(password);
//         if(!validPassword){
//             throw new Error("Invalid password. It should be at least 8 characters long and contain both letters and numbers.");
//         }