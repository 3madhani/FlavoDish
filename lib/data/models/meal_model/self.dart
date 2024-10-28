class Self {
  String? title;
  String? href;

  Self({this.title, this.href});

  factory Self.fromJson(Map<String, dynamic> json) => Self(
        title: json['title'] as String?,
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'href': href,
      };
}
