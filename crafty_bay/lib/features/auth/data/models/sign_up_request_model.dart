class SignUpRequestModel {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String city;
  final String phone;

  SignUpRequestModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.city,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": phone,
      "city": city,
    };
  }
}
