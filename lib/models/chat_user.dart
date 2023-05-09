class ChatUser {
  String? id, email, firstName, secondName, familyName, phone;

  ChatUser.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    firstName = map['firstName'];
    secondName = map['secondName'];
    familyName = map['familyName'];
    phone = map['phone'];
  }
}
