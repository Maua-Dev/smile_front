class UserIdModel {
  final String id;

  UserIdModel({required this.id});

  factory UserIdModel.fromMap(Map<String, dynamic> map) {
    return UserIdModel(
      id: map['id'],
    );
  }

  static List<UserIdModel> fromMaps(List array) {
    return array.map((e) => UserIdModel.fromMap(e)).toList();
  }
}
