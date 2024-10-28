import 'regular.dart';
import 'small.dart';
import 'thumbnail.dart';

class Images {
  Thumbnail? thumbnail;
  Small? small;
  Regular? regular;

  Images({this.thumbnail, this.small, this.regular});

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        thumbnail: json['THUMBNAIL'] == null
            ? null
            : Thumbnail.fromJson(json['THUMBNAIL'] as Map<String, dynamic>),
        small: json['SMALL'] == null
            ? null
            : Small.fromJson(json['SMALL'] as Map<String, dynamic>),
        regular: json['REGULAR'] == null
            ? null
            : Regular.fromJson(json['REGULAR'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'THUMBNAIL': thumbnail?.toJson(),
        'SMALL': small?.toJson(),
        'REGULAR': regular?.toJson(),
      };
}
