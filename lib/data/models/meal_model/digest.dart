import 'sub.dart';

class Digest {
  String? label;
  String? tag;
  String? schemaOrgTag;
  double? total;
  bool? hasRdi;
  double? daily;
  String? unit;
  List<Sub>? sub;

  Digest({
    this.label,
    this.tag,
    this.schemaOrgTag,
    this.total,
    this.hasRdi,
    this.daily,
    this.unit,
    this.sub,
  });

  factory Digest.fromJson(Map<String, dynamic> json) => Digest(
        label: json['label'] as String?,
        tag: json['tag'] as String?,
        schemaOrgTag: json['schemaOrgTag'] as String?,
        total: (json['total'] as num?)?.toDouble(),
        hasRdi: json['hasRDI'] as bool?,
        daily: (json['daily'] as num?)?.toDouble(),
        unit: json['unit'] as String?,
        sub: (json['sub'] as List<dynamic>?)
            ?.map((e) => Sub.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'tag': tag,
        'schemaOrgTag': schemaOrgTag,
        'total': total,
        'hasRDI': hasRdi,
        'daily': daily,
        'unit': unit,
        'sub': sub?.map((e) => e.toJson()).toList(),
      };
}
