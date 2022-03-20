import '../../../../shared/entities/user_registration.dart';

class RegisterUserInformationsModel extends UserRegistration {
  final String name;
  final String email;
  final String cpfRne;
  final int? ra;
  final String password;

  RegisterUserInformationsModel({
    required this.name,
    required this.email,
    required this.cpfRne,
    this.ra,
    required this.password,
  }) : super(name: name, email: email, cpfRne: cpfRne, password: password);

  Map<String, dynamic> toJson() => {
        'name': name,
        'cpfRne': cpfRne,
        'ra': ra,
        'password': password,
      };

  factory RegisterUserInformationsModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserInformationsModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      cpfRne: map['cpfRne'] ?? 0,
      ra: map['ra'] ?? 0,
      password: map['password'] ?? '',
    );
  }

  RegisterUserInformationsModel copyWith({
    String? name,
    String? email,
    String? cpfRne,
    int? ra,
    String? password,
  }) {
    return RegisterUserInformationsModel(
      name: name ?? this.name,
      email: email ?? this.email,
      cpfRne: cpfRne ?? this.cpfRne,
      ra: ra ?? this.ra,
      password: password ?? this.password,
    );
  }
}
