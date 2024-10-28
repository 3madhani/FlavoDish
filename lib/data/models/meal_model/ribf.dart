class Ribf {
  String? label;
  double? quantity;
  String? unit;

  Ribf({this.label, this.quantity, this.unit});

  factory Ribf.fromJson(Map<String, dynamic> json) => Ribf(
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
