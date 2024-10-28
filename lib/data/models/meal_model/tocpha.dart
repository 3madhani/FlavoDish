class Tocpha {
  String? label;
  double? quantity;
  String? unit;

  Tocpha({this.label, this.quantity, this.unit});

  factory Tocpha.fromJson(Map<String, dynamic> json) => Tocpha(
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
