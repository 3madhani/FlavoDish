class Folac {
  String? label;
  double? quantity; // Change to double to handle potential double values
  String? unit;

  Folac({this.label, this.quantity, this.unit});

  factory Folac.fromJson(Map<String, dynamic> json) => Folac(
        label: json['label'] as String?,
        quantity: (json['quantity'] is num) ? (json['quantity'] as num).toDouble() : null, // Convert to double
        unit: json['unit'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'quantity': quantity,
        'unit': unit,
      };
}
