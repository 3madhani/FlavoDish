class Water {
  String? label;
  double? quantity;
  String? unit;

  Water({this.label, this.quantity, this.unit});

  factory Water.fromJson(Map<String, dynamic> json) => Water(
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
