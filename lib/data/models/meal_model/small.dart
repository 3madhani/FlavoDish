class Small {
  String? url;
  int? width;
  int? height;

  Small({this.url, this.width, this.height});

  factory Small.fromJson(Map<String, dynamic> json) => Small(
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
