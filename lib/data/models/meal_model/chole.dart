class Chole {
  String? label;
  double? quantity;
  String? unit;

  Chole({this.label, this.quantity, this.unit});

  factory Chole.fromJson(Map<String, dynamic> json) => Chole(
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
