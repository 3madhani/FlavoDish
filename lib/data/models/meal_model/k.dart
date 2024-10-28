class K {
  String? label;
  double? quantity;
  String? unit;

  K({this.label, this.quantity, this.unit});

  factory K.fromJson(Map<String, dynamic> json) => K(
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
