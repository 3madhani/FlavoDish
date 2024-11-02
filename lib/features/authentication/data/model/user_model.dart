class UserModel {
  final String email;
  final String name;


  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
      };

  UserModel({
    required this.email,
    required this.name,
  });
}