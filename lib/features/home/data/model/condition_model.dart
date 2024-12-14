import 'package:hive_flutter/hive_flutter.dart';

part 'condition_model.g.dart'; // This is required for code generation

@HiveType(typeId: 2)
class Condition {
  Condition({
    required this.code,
    required this.icon,
    required this.text,
  });
  @HiveField(0)
  int code;
  @HiveField(1)
  String icon;
  @HiveField(2)
  String text;

  factory Condition.fromJson(Map<dynamic, dynamic> json) => Condition(
    code: json["code"],
    icon: json["icon"],
    text: json["text"],
  );

  Map<dynamic, dynamic> toJson() => {
    "code": code,
    "icon": icon,
    "text": text,
  };
}
