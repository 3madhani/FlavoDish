class Zn {
  String? label;
  double? quantity;
  String? unit;

  Zn({this.label, this.quantity, this.unit});

  factory Zn.fromJson(Map<String, dynamic> json) => Zn(
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
