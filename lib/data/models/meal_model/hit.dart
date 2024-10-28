import 'links.dart';
import 'recipe.dart';

class Hit {
  Recipe? recipe;
  Links? links;

  Hit({
    this.recipe,
    this.links,
  });

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        recipe: json['recipe'] == null
            ? null
            : Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
        links: json['_links'] == null
            ? null
            : Links.fromJson(json['_links'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'recipe': recipe?.toJson(),
        '_links': links?.toJson(),
      };
}
