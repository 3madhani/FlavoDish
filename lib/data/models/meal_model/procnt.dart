class Procnt {
  String? label;
  double? quantity;
  String? unit;

  Procnt({this.label, this.quantity, this.unit});

  factory Procnt.fromJson(Map<String, dynamic> json) => Procnt(
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
