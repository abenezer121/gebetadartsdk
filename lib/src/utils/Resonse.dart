class ResponseData {
  ResponseData(
      {required this.messages,
      this.statuss,
      this.path,
      this.totalDist,
      this.responseData,
      this.time});

  String messages = "";
  var statuss;
  var path;
  var totalDist;
  var responseData;
  var time;

  List get data {
    return responseData;
  }

  String get totaltime {
    return time;
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
