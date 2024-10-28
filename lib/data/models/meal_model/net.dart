class Net {
  String? label;
  double? quantity;
  String? unit;

  Net({this.label, this.quantity, this.unit});

  factory Net.fromJson(Map<String, dynamic> json) => Net(
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
