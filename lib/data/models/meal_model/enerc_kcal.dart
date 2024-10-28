class EnercKcal {
  String? label;
  double? quantity;
  String? unit;

  EnercKcal({this.label, this.quantity, this.unit});

  factory EnercKcal.fromJson(Map<String, dynamic> json) => EnercKcal(
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
