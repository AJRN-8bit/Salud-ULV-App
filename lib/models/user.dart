import 'dart:convert';

class User {
  final String id;
  final String userID;
  final String fullname;
  final String workPlace;
  final String vicerrectoria;
  final String email;
  final String password;
  final String token;

  User({
    required this.id,
    required this.userID,
    required this.fullname,
    required this.workPlace,
    required this.vicerrectoria,
    required this.email,
    required this.password,
    required this.token,
  });

  // Serialización: Convertir objeto a map
  // Un mapa es un calección de datos llave-valor
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userID': userID,
      'fullname': fullname,
      'workPlace': workPlace,
      'vicerrectoria': vicerrectoria,
      'email': email,
      'password': password,
      'token': token,
    };
  }
  
  String toJson()=> json.encode(toMap());
  factory User.fromMap(Map<String, dynamic> map){
       return User(
        id: map['_id'] as String? ?? '',
        userID: map['userID'] as String? ?? '',
        fullname: map['fullname'] as String? ?? '',
        workPlace: map['workPlace'] as String? ?? '',
        vicerrectoria: map['vicerrectoria'] as String? ?? '',
        email: map['email'] as String? ?? '',
        password: map['password'] as String? ?? '',
        token: map['token'] as String? ?? ''
       );
  }

  factory User.fromJson(String source) => 
    User.fromMap(json.decode(source) as Map<String, dynamic>); 
}
