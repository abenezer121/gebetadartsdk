import 'package:gebetamap/src/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'utils/Resonse.dart';

class GebetaMapRequest {
  Future<ResponseData> direction(
      Map directoinStart, Map directionStop, String apiKey) async {
    try {
      var url = Constants.url +
          "/direction/?la1=" +
          directoinStart["lat"].toString() +
          "&lo1=" +
          directoinStart["lon"].toString() +
          "&la2=" +
          directionStop["lat"].toString() +
          "&lo2=" +
          directionStop["lon"].toString() +
          "&apiKey=" +
          apiKey;
      final response = await http.get(Uri.parse(url));

      var decodedJson = json.decode(response.body);

      if (response.statusCode == 200) {
        var path = decodedJson["direction"] as List;
        ResponseData rs = ResponseData(
            messages: decodedJson["msg"],
            statuss: response.statusCode.toString(),
            path: path,
            totalDist: decodedJson["totalDistance"]);
        return rs;
      } else if (response.statusCode == 403) {
        ResponseData rs = ResponseData(
            messages: decodedJson["msg"],
            statuss: response.statusCode.toString());
        return rs;
      } else if (response.statusCode == 400) {
        ResponseData rs = ResponseData(
            messages: decodedJson["msg"],
            statuss: response.statusCode.toString());
        return rs;
      } else if (response.statusCode == 500) {
        ResponseData rs = ResponseData(
            messages: decodedJson["msg"],
            statuss: response.statusCode.toString());
        return rs;
      } else {
        ResponseData rs = ResponseData(messages: "UnKnown Error");
        return rs;
      }
    } catch (err) {
      throw err;
    }
  }

  Future<List<ResponseData>> matrix(var points, String apiKey) async {
    try {
      String _points = '';
      for (int i = 0; i < points.length; i++) {
        if (i == points.length - 1) {
          _points +=
              points[i]['lat'].toString() + "/" + points[i]['lon'].toString();
        } else {
          _points += points[i]['lat'].toString() +
              "/" +
              points[i]['lon'].toString() +
              ",";
        }
      }

      var url =
          Constants.url + "/matrix/?start=" + _points + "&apiKey=" + apiKey;
      final response = await http.get(Uri.parse(url));

      var decodedJson = json.decode(response.body);
      List<ResponseData> responseList = [];
      if (response.statusCode == 200) {
        var decodedResposne = decodedJson["response"] as List;

        for (int i = 0; i < decodedResposne.length; i++) {
          // var path = response[i]["direction"] as List;
          ResponseData rs = ResponseData(
              messages: decodedResposne[i]["data"]["msg"],
              statuss: response.statusCode.toString(),
              totalDist: decodedResposne[i]["data"]["totalDistance"],
              path: decodedResposne[i]["data"]["direction"]);

          responseList.add(rs);
        }
      } else if (response.statusCode == 403) {
        ResponseData rs = ResponseData(
            messages: "Invalid Api Key",
            statuss: response.statusCode.toString());
        responseList.add(rs);
      } else if (response.statusCode == 400) {
        ResponseData rs = ResponseData(
            messages: "Route Not Found",
            statuss: response.statusCode.toString());
        responseList.add(rs);
      } else if (response.statusCode == 500) {
        ResponseData rs = ResponseData(
            messages: "Internal Server Error",
            statuss: response.statusCode.toString());
        responseList.add(rs);
      } else {
        ResponseData rs = new ResponseData(messages: "UnKnown Error");
        responseList.add(rs);
      }
      return responseList;
    } catch (err) {
      throw err;
    }
    //loop through the points and it
  }

// ignore: non_constant_identifier_names
  Future<ResponseData> tss(var points, String apiKey) async {
    try {
      String _points = '';
      for (int i = 0; i < points.length; i++) {
        if (i == points.length - 1) {
          _points +=
              points[i]['lat'].toString() + "/" + points[i]['lon'].toString();
        } else {
          _points += points[i]['lat'].toString() +
              "/" +
              points[i]['lon'].toString() +
              ",";
        }
      }

      var url = Constants.url + "/tss/?start=" + _points + "&apiKey=" + apiKey;
      final response = await http.get(Uri.parse(url));
      var decodedJson = json.decode(response.body);

      if (response.statusCode == 200) {
        var path = decodedJson["direction"] as List;
        ResponseData rs = ResponseData(
            messages: decodedJson["msg"],
            statuss: response.statusCode.toString(),
            path: path,
            totalDist: decodedJson["totalDistance"]);
        return rs;
      } else if (response.statusCode == 403) {
        ResponseData rs = ResponseData(
            messages: decodedJson["msg"],
            statuss: response.statusCode.toString());
        return rs;
      } else if (response.statusCode == 400) {
        ResponseData rs = ResponseData(
            messages: decodedJson["msg"],
            statuss: response.statusCode.toString());
        return rs;
      } else if (response.statusCode == 500) {
        ResponseData rs = ResponseData(
            messages: decodedJson["msg"],
            statuss: response.statusCode.toString());
        return rs;
      } else {
        ResponseData rs = ResponseData(messages: "UnKnown Error");
        return rs;
      }
    } catch (err) {
      throw err;
    }
  }

// ignore: non_constant_identifier_names
  Future<List<ResponseData>> OneToMany(
      var directionStart, var points, String apiKey) async {
    try {
      String _points = '';
      for (int i = 0; i < points.length; i++) {
        if (i == points.length - 1) {
          _points +=
              points[i]['lat'].toString() + "/" + points[i]['lon'].toString();
        } else {
          _points += points[i]['lat'].toString() +
              "/" +
              points[i]['lon'].toString() +
              ",";
        }
      }
      var url = Constants.url +
          "/onm/?la1=" +
          directionStart["lat"].toString() +
          "&lo1=" +
          directionStart["lon"].toString() +
          "&json=" +
          _points +
          "&apiKey=" +
          apiKey;

      final response = await http.get(Uri.parse(url));
      // print('Response status: ${response.statusCode}');
      var decodedJson = json.decode(response.body);
      List<ResponseData> responseList = [];
      if (response.statusCode == 200) {
        var decodedResposne = decodedJson["directions"] as List;
        for (int i = 0; i < decodedResposne.length; i++) {
          // var path = response[i]["direction"] as List;
          ResponseData rs = ResponseData(
              messages: decodedResposne[i]["msg"],
              statuss: response.statusCode.toString(),
              totalDist: decodedResposne[i]["totalDistance"],
              path: decodedResposne[i]["direction"]);

          responseList.add(rs);
        }
      } else if (response.statusCode == 403) {
        ResponseData rs = ResponseData(
            messages: "Invalid Api Key",
            statuss: response.statusCode.toString());
        responseList.add(rs);
      } else if (response.statusCode == 400) {
        ResponseData rs = ResponseData(
            messages: "Route Not Found",
            statuss: response.statusCode.toString());
        responseList.add(rs);
      } else if (response.statusCode == 500) {
        ResponseData rs = ResponseData(
            messages: "Internal Server Error",
            statuss: response.statusCode.toString());
        responseList.add(rs);
      } else {
        ResponseData rs = ResponseData(messages: "UnKnown Error");
        responseList.add(rs);
      }
      return responseList;
    } catch (err) {
      throw err;
    }
  }

  Future<ResponseData> geocode(String name, String apiKey) async {
    try {
      var url = "https://mapapi.gebeta.app/api/v1/route/geocoding?name=" +
          name +
          "&apiKey=" +
          apiKey;
      final response = await http.get(Uri.parse(url));
      var decodedJson = json.decode(response.body);
      print(decodedJson);
      if (response.statusCode == 200) {
        var path = decodedJson["data"] as List;
        ResponseData rs = ResponseData(
            messages: decodedJson["msg"],
            statuss: response.statusCode.toString(),
            responseData: decodedJson["data"]);
        return rs;
      } else if (response.statusCode == 403) {
        ResponseData rs = ResponseData(
            messages: decodedJson["msg"],
            statuss: response.statusCode.toString());
        return rs;
      } else if (response.statusCode == 400) {
        ResponseData rs = ResponseData(
            messages: decodedJson["msg"],
            statuss: response.statusCode.toString());
        return rs;
      } else if (response.statusCode == 500) {
        ResponseData rs = ResponseData(
            messages: decodedJson["msg"],
            statuss: response.statusCode.toString());
        return rs;
      } else {
        ResponseData rs = ResponseData(messages: "UnKnown Error");
        return rs;
      }
    } catch (err) {
      throw err;
    }
  }
}
