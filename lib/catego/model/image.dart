class ImageAPI {
  int? id;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? src;
  String? title;
  String? alt;

  ImageAPI({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.title,
    this.alt,
  });

  factory ImageAPI.fromJson(Map<String, dynamic> json) => ImageAPI(
        id: json['id'] as int?,
        dateCreated: json['date_created'] == null
            ? null
            : DateTime.parse(json['date_created'] as String),
        dateCreatedGmt: json['date_created_gmt'] == null
            ? null
            : DateTime.parse(json['date_created_gmt'] as String),
        dateModified: json['date_modified'] == null
            ? null
            : DateTime.parse(json['date_modified'] as String),
        dateModifiedGmt: json['date_modified_gmt'] == null
            ? null
            : DateTime.parse(json['date_modified_gmt'] as String),
        src: json['src'],
        title: json['title'] as String?,
        alt: json['alt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date_created': dateCreated?.toIso8601String(),
        'date_created_gmt': dateCreatedGmt?.toIso8601String(),
        'date_modified': dateModified?.toIso8601String(),
        'date_modified_gmt': dateModifiedGmt?.toIso8601String(),
        'src': src,
        'title': title,
        'alt': alt,
      };
}
