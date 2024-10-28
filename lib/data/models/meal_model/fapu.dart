class Fapu {
  String? label;
  double? quantity;
  String? unit;

  Fapu({this.label, this.quantity, this.unit});

  factory Fapu.fromJson(Map<String, dynamic> json) => Fapu(
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
