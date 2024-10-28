class P {
  String? label;
  double? quantity;
  String? unit;

  P({this.label, this.quantity, this.unit});

  factory P.fromJson(Map<String, dynamic> json) => P(
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
