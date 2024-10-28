class Nia {
  String? label;
  double? quantity;
  String? unit;

  Nia({this.label, this.quantity, this.unit});

  factory Nia.fromJson(Map<String, dynamic> json) => Nia(
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
