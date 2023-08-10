import 'dart:convert';

import 'package:equatable/equatable.dart';

User mockedUser = const User(
    id: 0,
    email: 'email',
    firstName: 'firstName',
    lastName: 'lastName',
    photo:
        'https://cdn-icons-png.flaticon.com/512/561/561782.png?w=740&t=st=1691601147~exp=1691601747~hmac=2a42be4c82177ee90c00785d22bc0786d8b0f6c5f548e5cf87b95457d9ff0dcd');

class User extends Equatable {
  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.photo,
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String photo;

  @override
  List<Object?> get props => [id, email, firstName, lastName, photo];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'photo': photo,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map['id'] as int,
        email: map['email'] as String,
        firstName: map['firstName'] as String,
        lastName: map['lastName'] as String,
        photo: map['photo'] as String,
      );

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
