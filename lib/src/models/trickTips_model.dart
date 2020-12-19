import 'package:flutter/foundation.dart';

enum TrickTipsCategory { Flat, Grind, Transition }

enum TrickTipsLevel { Beginner, Advanced, Experts }

class TrickTipsModel {
  String id;
  String title;
  String thumbnail;
  String description;
  String url;
  TrickTipsCategory category;
  TrickTipsLevel level;
  List<String> sequence = List<String>();
  List<String> descriptionStep = List<String>();
  int totalStep;

  TrickTipsModel(
      {this.id,
      this.title,
      this.thumbnail,
      this.description,
      this.url,
      this.category,
      this.level,
      this.sequence,
      this.descriptionStep,
      this.totalStep});

  TrickTipsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    url = json['url'];
    category = TrickTipsCategory.values.firstWhere(
        (d) =>
            describeEnum(d).toLowerCase() ==
            json['category'].toString().toLowerCase(),
        orElse: () => null);
    level = TrickTipsLevel.values.firstWhere(
        (d) =>
            describeEnum(d).toLowerCase() ==
            json['level'].toString().toLowerCase(),
        orElse: () => null);
    if (json['sequence'] != null) {
      json['sequence'].forEach((v) {
        sequence.add(v);
      });
    }
    if (json['descriptionStep'] != null) {
      json['descriptionStep'].forEach((v) {
        descriptionStep.add(v);
      });
    }
    totalStep = descriptionStep.length;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "description": description,
        "url": url,
        "category": category.toString().toLowerCase(),
        "level": level.toString().toLowerCase(),
        "sequence": sequence,
        "descriptionStep": descriptionStep,
        "totalStep": totalStep,
      };
}
