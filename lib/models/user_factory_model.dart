class User {
  final String id;
  final String name;
  final String password;
  final String accessToken;
  final UserRole role;
  String? email;
  String? phone;

  User({
    required this.id,
    required this.name,
    required this.role,
    required this.password,
    required this.accessToken,
    this.email,
    this.phone
  });

  factory User.admin({required String id, required String name, required String password, required String accessToken}) {
    return User(id: id, name: name, role: UserRole.admin, password: password, accessToken: accessToken);
  }

  factory User.employee({required String id, required String name, required String password, required String accessToken}) {
    return User(id: id, name: name, role: UserRole.employee, password: password, accessToken: accessToken);
  }

  factory User.customer({required String id, required String name, required String password, required String accessToken, required String email, required String phone}) {
    return User(id: id, name: name, role: UserRole.customer, password: password, accessToken: accessToken, email: email, );
  }
}

enum UserRole {
  admin,
  employee,
  customer,
}