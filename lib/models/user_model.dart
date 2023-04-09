class User {
  String? userID;
  String username;
  String? password;
  String role;

  User({
    this.userID,
    required this.username,
    this.password,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final userData = json['user'];
    String roleString = userData['role'] == 1 ? 'admin' : 'employee';
    return User(
      userID: userData['id'],
      username: userData['username'],
      password: userData['password'],
      role: roleString,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userID,
      'username': username,
      'password': password,
      'role': role,
    };
  }
}