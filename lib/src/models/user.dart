class User {
  final String about;
  final int createdTime;
  final String created;
  final String id;
  final int karma;

  User({this.about, this.createdTime, this.created, this.id, this.karma});

  User.fromJson(Map<String, dynamic> json)
      : about = json['about'],
        createdTime = json['created_time'],
        created = json['created'],
        id = json['id'],
        karma = json['karma'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    data['created_time'] = this.createdTime;
    data['created'] = this.created;
    data['id'] = this.id;
    data['karma'] = this.karma;
    return data;
  }

  @override
  String toString() {
    return 'User{about: $about, createdTime: $createdTime, created: $created, id: $id, karma: $karma}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          about == other.about &&
          createdTime == other.createdTime &&
          created == other.created &&
          id == other.id &&
          karma == other.karma;

  @override
  int get hashCode =>
      about.hashCode ^
      createdTime.hashCode ^
      created.hashCode ^
      id.hashCode ^
      karma.hashCode;
}
