import 'next.dart';

class Links {
  Next? next;

  Links({this.next});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        next: json['next'] == null
            ? null
            : Next.fromJson(json['next'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'next': next?.toJson(),
      };
}
