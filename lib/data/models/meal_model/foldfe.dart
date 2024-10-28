class Foldfe {
  String? label;
  double? quantity;
  String? unit;

  Foldfe({this.label, this.quantity, this.unit});

  factory Foldfe.fromJson(Map<String, dynamic> json) => Foldfe(
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
