class Vitc {
  String? label;
  double? quantity;
  String? unit;

  Vitc({this.label, this.quantity, this.unit});

  factory Vitc.fromJson(Map<String, dynamic> json) => Vitc(
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
