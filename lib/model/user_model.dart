class User {
  late String email;
  late String password;
  String? number;
  String? address;

  User(
      {required this.email, required this.password, this.number, this.address});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    number = json['number'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'number': number,
        'address': address,
      };
}
