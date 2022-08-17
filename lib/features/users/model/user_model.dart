class UserModel {
  String id;
  String name;
  String email;
  String phone;
  String password;
  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.password});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'password': password
      };
}
