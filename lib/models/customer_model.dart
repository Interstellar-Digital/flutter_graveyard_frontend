class Customer {
  final String id;
  final String name;
  final String email;
  final String phone;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      email: json['email_address'],
      phone: json['phone_number'],
    );
  }

  get phoneNumber => phone;

  get emailAddress => email;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email_address': email,
      'phone_number': phone,
    };
  }
}