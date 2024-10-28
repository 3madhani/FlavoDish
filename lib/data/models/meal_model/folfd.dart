class Folfd {
  String? label;
  double? quantity;
  String? unit;

  Folfd({this.label, this.quantity, this.unit});

  factory Folfd.fromJson(Map<String, dynamic> json) => Folfd(
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
