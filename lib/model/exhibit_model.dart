import 'package:json_annotation/json_annotation.dart';

part 'exhibit_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Exhibit {
  Exhibit({
    required this.title,
    required this.images,
  });

  String title;
  List<String> images;

  factory Exhibit.fromJson(Map<String, dynamic> json) => _$ExhibitFromJson(json);

  Map<String, dynamic> toJson() => _$ExhibitToJson(this);
}
