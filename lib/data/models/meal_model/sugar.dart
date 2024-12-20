class Sugar {
  String? label;
  double? quantity;
  String? unit;

  Sugar({this.label, this.quantity, this.unit});

  factory Sugar.fromJson(Map<String, dynamic> json) => Sugar(
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
