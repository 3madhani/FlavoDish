class Next {
  String? href;
  String? title;

  Next({this.href, this.title});

  factory Next.fromJson(Map<String, dynamic> json) => Next(
        href: json['href'] as String?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
        'title': title,
      };
}
