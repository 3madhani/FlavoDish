class Ca {
  String? label;
  double? quantity;
  String? unit;

  Ca({this.label, this.quantity, this.unit});

  factory Ca.fromJson(Map<String, dynamic> json) => Ca(
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
