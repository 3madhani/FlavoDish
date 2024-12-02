import 'digest.dart';
import 'images.dart';
import 'ingredient.dart';
import 'total_daily.dart';
import 'total_nutrients.dart';

class Recipe {
  String? uri;
  String? label;
  String? image;
  Images? images;
  String? source;
  String? url;
  String? shareAs;
  int? yield;
  List<String>? dietLabels;
  List<String>? healthLabels;
  List<String>? cautions;
  List<String>? ingredientLines;
  List<Ingredient>? ingredients;
  double? calories;
  double? totalCo2Emissions;
  String? co2EmissionsClass;
  double? totalWeight;
  int? totalTime;
  List<String>? cuisineType;
  List<String>? mealType;
  List<String>? dishType;
  TotalNutrients? totalNutrients;
  TotalDaily? totalDaily;
  List<Digest>? digest;

  Recipe({
    this.uri,
    this.label,
    this.image,
    this.images,
    this.source,
    this.url,
    this.shareAs,
    this.yield,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.ingredientLines,
    this.ingredients,
    this.calories,
    this.totalCo2Emissions,
    this.co2EmissionsClass,
    this.totalWeight,
    this.totalTime,
    this.cuisineType,
    this.mealType,
    this.dishType,
    this.totalNutrients,
    this.totalDaily,
    this.digest,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        uri: json['uri'] as String?,
        label: json['label'] as String?,
        image: json['image'] as String?,
        images: json['images'] == null
            ? null
            : Images.fromJson(json['images'] as Map<String, dynamic>),
        source: json['source'] as String?,
        url: json['url'] as String?,
        shareAs: json['shareAs'] as String?,
        yield: json['yield'] is String
            ? int.tryParse(json['yield'])
            : (json['yield'] as num?)?.toInt(),
        dietLabels: (json['dietLabels'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        healthLabels: (json['healthLabels'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        cautions: (json['cautions'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        ingredientLines: (json['ingredientLines'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        ingredients: (json['ingredients'] as List<dynamic>?)
            ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
            .toList(),
        calories: json['calories'] is String
            ? double.tryParse(json['calories'])
            : (json['calories'] as num?)?.toDouble(),
        totalCo2Emissions: json['totalCO2Emissions'] is String
            ? double.tryParse(json['totalCO2Emissions'])
            : (json['totalCO2Emissions'] as num?)?.toDouble(),
        co2EmissionsClass: json['co2EmissionsClass'] as String?,
        totalWeight: json['totalWeight'] is String
            ? double.tryParse(json['totalWeight'])
            : (json['totalWeight'] as num?)?.toDouble(),
        totalTime: json['totalTime'] is String
            ? int.tryParse(json['totalTime'])
            : (json['totalTime'] as num?)?.toInt(),
        cuisineType: (json['cuisineType'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        mealType: (json['mealType'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        dishType: (json['dishType'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        totalNutrients: json['totalNutrients'] == null
            ? null
            : TotalNutrients.fromJson(
                json['totalNutrients'] as Map<String, dynamic>),
        totalDaily: json['totalDaily'] == null
            ? null
            : TotalDaily.fromJson(json['totalDaily'] as Map<String, dynamic>),
        digest: (json['digest'] as List<dynamic>?)
            ?.map((e) => Digest.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'uri': uri,
        'label': label,
        'image': image,
        'images': images?.toJson(),
        'source': source,
        'url': url,
        'shareAs': shareAs,
        'yield': yield,
        'dietLabels': dietLabels,
        'healthLabels': healthLabels,
        'cautions': cautions,
        'ingredientLines': ingredientLines,
        'ingredients': ingredients?.map((e) => e.toJson()).toList(),
        'calories': calories,
        'totalCO2Emissions': totalCo2Emissions,
        'co2EmissionsClass': co2EmissionsClass,
        'totalWeight': totalWeight,
        'totalTime': totalTime,
        'cuisineType': cuisineType,
        'mealType': mealType,
        'dishType': dishType,
        'totalNutrients': totalNutrients?.toJson(),
        'totalDaily': totalDaily?.toJson(),
        'digest': digest?.map((e) => e.toJson()).toList(),
      };
}
