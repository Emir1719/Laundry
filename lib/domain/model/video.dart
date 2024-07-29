class Video {
  final int id;
  final String title;
  final String url;

  Video({
    required this.id,
    required this.title,
    required this.url,
  });

  Video copyWith({
    int? id,
    String? title,
    String? url,
  }) =>
      Video(
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'url': url,
      };

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json['id'],
        title: json['title'],
        url: json['url'],
      );
}
