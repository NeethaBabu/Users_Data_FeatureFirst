class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String emailId;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ??"",
      firstName: json['firstName']??"",
      lastName: json['lastName']??"",
      emailId: json['emailId']??"",
    );
  }
}
