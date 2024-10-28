class Vitb12 {
  String? label;
  double? quantity;
  String? unit;

  Vitb12({this.label, this.quantity, this.unit});

  factory Vitb12.fromJson(Map<String, dynamic> json) => Vitb12(
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
