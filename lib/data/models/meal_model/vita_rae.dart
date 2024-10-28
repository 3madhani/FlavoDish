class VitaRae {
  String? label;
  double? quantity;
  String? unit;

  VitaRae({this.label, this.quantity, this.unit});

  factory VitaRae.fromJson(Map<String, dynamic> json) => VitaRae(
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
