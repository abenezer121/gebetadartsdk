class ResponseData {
  ResponseData(
      {required this.messages,
      this.statuss,
      this.path,
      this.totalDist,
      this.responseData});

  String messages = "";
  var statuss;
  var path;
  var totalDist;
  var responseData;

  List get data {
    return responseData;
  }

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
