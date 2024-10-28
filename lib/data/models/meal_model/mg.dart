class Mg {
  String? label;
  double? quantity;
  String? unit;

  Mg({this.label, this.quantity, this.unit});

  factory Mg.fromJson(Map<String, dynamic> json) => Mg(
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
