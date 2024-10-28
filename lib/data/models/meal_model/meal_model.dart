import 'hit.dart';
import 'links.dart';

class MealModel {
  int? from;
  int? to;
  int? count;
  Links? links;
  List<Hit>? hits;

  MealModel({this.from, this.to, this.count, this.links, this.hits});

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        from: json['from'] as int?,
        to: json['to'] as int?,
        count: json['count'] as int?,
        links: json['_links'] == null
            ? null
            : Links.fromJson(json['_links'] as Map<String, dynamic>),
        hits: (json['hits'] as List<dynamic>?)
            ?.map((e) => Hit.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'count': count,
        '_links': links?.toJson(),
        'hits': hits?.map((e) => e.toJson()).toList(),
      };
}
