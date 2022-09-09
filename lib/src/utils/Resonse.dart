class ResponseData {
  ResponseData(
      {required this.messages, this.statuss, this.path, this.totalDist});

  String messages = "";
  var statuss;
  var path;
  var totalDist;

  String get message {
    return messages;
  }

  String get status {
    return statuss;
  }

  double get totalDistance {
    return totalDist;
  }

  List get paths {
    return path;
  }
}
