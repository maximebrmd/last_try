import 'package:flutter/foundation.dart';

enum TrickTipsCategory { Flat, Grind, Transition }

enum TrickTipsLevel { Beginner, Advance, Expert }

extension EnumExtension on String {
  T toEnum<T>(Iterable<T> values, String value) => values.firstWhere(
      (d) => describeEnum(d).toLowerCase() == value.toLowerCase(),
      orElse: () => null);
}

class TrickTipsModel {
  int id;
  String title;
  String description;
  String url;
  TrickTipsCategory category;
  TrickTipsLevel level;
  List<String> sequence;
  List<String> descriptionStep;
  int totalStep;

  TrickTipsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    category = json['category'].toEnum<TrickTipsCategory>();
    level = json['level'].toEnum<TrickTipsLevel>();
    for (int i = 0; i < json['sequence'].length; i++) {
      sequence.add(json['sequence'][i]);
    }
    for (int i = 0; i < json['descriptionStep'].length; i++) {
      descriptionStep.add(json['descriptionStep'][i]);
    }
    totalStep = json['descriptionStep'].length;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "url": url,
        "category": category.toString().toLowerCase(),
        "level": level.toString().toLowerCase(),
        "sequence": sequence,
        "descriptionStep": descriptionStep,
        "totalStep": totalStep,
      };
}
