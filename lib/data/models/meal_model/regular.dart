class Regular {
  String? url;
  int? width;
  int? height;

  Regular({this.url, this.width, this.height});

  factory Regular.fromJson(Map<String, dynamic> json) => Regular(
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
