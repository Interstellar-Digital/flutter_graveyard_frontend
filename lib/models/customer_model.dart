class Customer {
  final String name;
  final String email;
  final String phone;

  Customer({
    required this.name,
    required this.email,
    required this.phone,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      name: json['name'],
      email: json['email_address'],
      phone: json['phone_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email_address': email,
      'phone_number': phone,
    };
  }
}