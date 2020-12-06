enum TrickTipsCategory { Flat, Grind, Transition }

enum TrickTipsLevel { Beginner, Advance, Expert }

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
    category = json['category'];
    level = json['level'];
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
        "category": category.toString(),
        "level": level.toString(),
        "sequence": sequence,
        "descriptionStep": descriptionStep,
        "totalStep": totalStep,
      };
}
