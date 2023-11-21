class UserModel {
  String? name;
  String? email;
  String? uid;
  String? phoneNo;
  String? createdAt;

  UserModel({
    this.name,
    this.email,
    this.uid,
    this.phoneNo,
    this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
      phoneNo: map['phoneNo'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "uid": uid,
      "phoneNo": phoneNo,
      "createdAt": createdAt,
    };
  }
}
