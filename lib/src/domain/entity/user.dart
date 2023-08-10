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
}
