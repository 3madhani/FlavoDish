class Vitk1 {
  String? label;
  double? quantity;
  String? unit;

  Vitk1({this.label, this.quantity, this.unit});

  factory Vitk1.fromJson(Map<String, dynamic> json) => Vitk1(
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
