class Vitb6A {
  String? label;
  double? quantity;
  String? unit;

  Vitb6A({this.label, this.quantity, this.unit});

  factory Vitb6A.fromJson(Map<String, dynamic> json) => Vitb6A(
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
