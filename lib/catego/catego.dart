import 'image.dart';
import 'links.dart';

class Catego {
  int? id;
  String? name;
  String? slug;
  int? parent;
  String? description;
  String? display;
  ImageAPI? image;
  int? menuOrder;
  int? count;
  Links? links;

  Catego({
    this.id,
    this.name,
    this.slug,
    this.parent,
    this.description,
    this.display,
    this.image,
    this.menuOrder,
    this.count,
    this.links,
  });

  factory Catego.fromJson(Map<String, dynamic> json) => Catego(
        id: json['id'] as int?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        parent: json['parent'] as int?,
        description: json['description'] as String?,
        display: json['display'] as String?,
        image: json['image'] == null
            ? null
            : ImageAPI.fromJson(json['image'] as Map<String, dynamic>),
        menuOrder: json['menu_order'] as int?,
        count: json['count'] as int?,
        links: json['_links'] == null
            ? null
            : Links.fromJson(json['_links'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'parent': parent,
        'description': description,
        'display': display,
        'image': image?.toJson(),
        'menu_order': menuOrder,
        'count': count,
        '_links': links?.toJson(),
      };
}
