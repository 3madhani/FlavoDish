class Fat {
  String? label;
  double? quantity;
  String? unit;

  Fat({this.label, this.quantity, this.unit});

  factory Fat.fromJson(Map<String, dynamic> json) => Fat(
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
