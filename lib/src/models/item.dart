class Item {
  final int id;
  final String title;
  final int points;
  final String user;
  final int time;
  final String timeAgo;
  final String type;
  final String content;
  final List<Item> comments;
  final int commentsCount;
  final String url;
  final String domain;

  Item({
    this.id,
    this.title,
    this.points,
    this.user,
    this.time,
    this.timeAgo,
    this.type,
    this.content,
    this.comments,
    this.commentsCount,
    this.url,
    this.domain,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    final comments = new List<Item>();

    if (json['comments'] != null) {
      json['comments'].forEach((v) {
        comments.add(new Item.fromJson(v));
      });
    }

    return Item(
      id: json['id'],
      title: json['title'],
      points: json['points'],
      user: json['user'],
      time: json['time'],
      timeAgo: json['time_ago'],
      type: json['type'],
      content: json['content'],
      comments: comments,
      commentsCount: json['comments_count'],
      url: json['url'],
      domain: json['domain'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['points'] = this.points;
    data['user'] = this.user;
    data['time'] = this.time;
    data['time_ago'] = this.timeAgo;
    data['type'] = this.type;
    data['content'] = this.content;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    data['comments_count'] = this.commentsCount;
    data['url'] = this.url;
    data['domain'] = this.domain;
    return data;
  }

  @override
  String toString() {
    return 'Item{id: $id, title: $title, points: $points, user: $user, time: $time, timeAgo: $timeAgo, type: $type, content: $content, comments: $comments, commentsCount: $commentsCount, url: $url, domain: $domain}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          points == other.points &&
          user == other.user &&
          time == other.time &&
          timeAgo == other.timeAgo &&
          type == other.type &&
          content == other.content &&
          comments == other.comments &&
          commentsCount == other.commentsCount &&
          url == other.url &&
          domain == other.domain;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      points.hashCode ^
      user.hashCode ^
      time.hashCode ^
      timeAgo.hashCode ^
      type.hashCode ^
      content.hashCode ^
      comments.hashCode ^
      commentsCount.hashCode ^
      url.hashCode ^
      domain.hashCode;
}
