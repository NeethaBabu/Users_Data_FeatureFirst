class UserDataModel {
  final int id;
  final String firstName;
  final String email;
  final String image;

  UserDataModel({
    required this.id,
    required this.firstName,
    required this.email,
    required this.image,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      firstName: json['firstName'],
      email: json['email'],
      image: json['image'],
    );
  }
}
