class UserModel {
  String? id, email;
  UserModel({required this.email});

  UserModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
    };
  }
}
