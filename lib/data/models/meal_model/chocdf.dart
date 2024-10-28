class Chocdf {
  String? label;
  double? quantity;
  String? unit;

  Chocdf({this.label, this.quantity, this.unit});

  factory Chocdf.fromJson(Map<String, dynamic> json) => Chocdf(
        label: json['label'] as String?,
        quantity: (json['quantity'] as num?)?.toDouble(),
        unit: json['unit'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'quantity': quantity,
        'unit': unit,
      };
}
