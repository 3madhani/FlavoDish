class Sub {
  String? label;
  String? tag;
  String? schemaOrgTag;
  double? total;
  bool? hasRdi;
  double? daily;
  String? unit;

  Sub({
    this.label,
    this.tag,
    this.schemaOrgTag,
    this.total,
    this.hasRdi,
    this.daily,
    this.unit,
  });

  factory Sub.fromJson(Map<String, dynamic> json) => Sub(
        label: json['label'] as String?,
        tag: json['tag'] as String?,
        schemaOrgTag: json['schemaOrgTag'] as String?,
        total: (json['total'] as num?)?.toDouble(),
        hasRdi: json['hasRDI'] as bool?,
        daily: (json['daily'] as num?)?.toDouble(),
        unit: json['unit'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'tag': tag,
        'schemaOrgTag': schemaOrgTag,
        'total': total,
        'hasRDI': hasRdi,
        'daily': daily,
        'unit': unit,
      };
}
