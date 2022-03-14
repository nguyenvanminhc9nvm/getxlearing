class Community {
  String? id;
  String? title;
  String? description;
  int? views;
  int? ups;
  int? down;
  List<Tag>? tags;

  Community(this.id, this.title, this.description, this.views, this.ups,
      this.down, this.tags);

  factory Community.fromJson(dynamic json) {
    return Community(
      json['id'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      json['views'] as int?,
      json['ups'] as int?,
      json['down'] as int?,
      json['tags'] == null
          ? null
          : ((json['tags'] as List?)
              ?.map((e) => Tag.fromJson(e))
              .toList()),
    );
  }
}

class Tag {
  String? name;

  Tag(this.name);

  factory Tag.fromJson(dynamic json) {
    return Tag(json['name'] as String?);
  }
}
