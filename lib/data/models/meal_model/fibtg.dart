class Fibtg {
  String? label;
  double? quantity;
  String? unit;

  Fibtg({this.label, this.quantity, this.unit});

  factory Fibtg.fromJson(Map<String, dynamic> json) => Fibtg(
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
