class UserIdModel {
  final String userId;

  UserIdModel({required this.userId});

  factory UserIdModel.fromMap(Map<String, dynamic> map) {
    return UserIdModel(
      userId: map['id'],
    );
  }

  static List<UserIdModel> fromMaps(List array) {
    return array.map((e) => UserIdModel.fromMap(e)).toList();
  }
}
