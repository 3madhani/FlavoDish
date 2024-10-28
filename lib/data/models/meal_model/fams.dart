class Fams {
  String? label;
  double? quantity;
  String? unit;

  Fams({this.label, this.quantity, this.unit});

  factory Fams.fromJson(Map<String, dynamic> json) => Fams(
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
