class Ingredient {
  String? text;
  double? quantity;
  String? measure;
  String? food;
  double? weight;
  String? foodCategory;
  String? foodId;
  String? image;

  Ingredient({
    this.text,
    this.quantity,
    this.measure,
    this.food,
    this.weight,
    this.foodCategory,
    this.foodId,
    this.image,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    assert(json['text'] != null, 'Ingredient text should not be null');
    assert(json['quantity'] != null, 'Ingredient quantity should not be null');
    assert(json['food'] != null, 'Ingredient food should not be null');
    // Add other asserts if there are fields that are required to be non-null

    return Ingredient(
      text: json['text'] as String? ?? 'Unknown',
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
      measure: json['measure'] as String? ?? 'N/A',
      food: json['food'] as String? ?? 'Unknown',
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      foodCategory: json['foodCategory'] as String?,
      foodId: json['foodId'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'text': text,
        'quantity': quantity,
        'measure': measure,
        'food': food,
        'weight': weight,
        'foodCategory': foodCategory,
        'foodId': foodId,
        'image': image,
      };
}
