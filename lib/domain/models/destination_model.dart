class DestinationModel {
  final List<SingleDestinationModel> destinationList;

  DestinationModel({this.destinationList = const []});

  static DestinationModel fromJson(Map<String, dynamic> json) {
    List<SingleDestinationModel> destinationList = [];

    if (json.containsKey("getDestinationList") &&
        json["getDestinationList"] != null) {
      for (var element in json["getDestinationList"]) {
        destinationList.add(SingleDestinationModel.fromJson(element ?? {}));
      }
    }
    return DestinationModel(destinationList: destinationList);
  }
}

class SingleDestinationModel {
  final String? destination;
  final String? portraitImage;
  final String? url;

  SingleDestinationModel({this.destination, this.portraitImage, this.url});

  static SingleDestinationModel fromJson(Map<String, dynamic> json) {
    return SingleDestinationModel(
      destination: json["destination"],
      url: json["url"],
      portraitImage: json["portraitImage"],
    );
  }
}
