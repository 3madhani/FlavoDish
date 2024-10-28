class Na {
  String? label;
  double? quantity;
  String? unit;

  Na({this.label, this.quantity, this.unit});

  factory Na.fromJson(Map<String, dynamic> json) => Na(
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
