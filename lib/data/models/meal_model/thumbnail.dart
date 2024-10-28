class Thumbnail {
  String? url;
  int? width;
  int? height;

  Thumbnail({this.url, this.width, this.height});

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        url: json['url'] as String?,
        width: json['width'] as int?,
        height: json['height'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'width': width,
        'height': height,
      };
}
