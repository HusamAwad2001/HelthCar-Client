class TopicModel {
  String? id;
  String title;
  String description;
  String image;
  String information;
  String infoType;

  TopicModel({
    this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.information,
    required this.infoType,
  });


  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      image: json["image"],
      information: json["information"],
      infoType: json["infoType"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "image": image,
      "information": information,
      "infoType": infoType,
    };
  }
}
