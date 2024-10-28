class Thia {
  String? label;
  double? quantity;
  String? unit;

  Thia({this.label, this.quantity, this.unit});

  factory Thia.fromJson(Map<String, dynamic> json) => Thia(
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
