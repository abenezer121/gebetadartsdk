import 'package:gebetamap/gebetamap.dart';

void callDirection() async {
  GebetaMapRequest gmr = new GebetaMapRequest();
  var directionStart = new Map();
  directionStart["lat"] = 9.022528936095531;
  directionStart["lon"] = 38.80400061607361;
  var directionStop = new Map();
  directionStop["lat"] = 9.021755421022991;
  directionStop["lon"] = 38.79883468151093;
  String apiKey = "";
  ResponseData rds = await gmr.direction(directionStart, directionStop, apiKey);
  print('Response message: ${rds.message}');
  print('Response status: ${rds.status}');
  print('path: ${rds.path}');
  print('distance: ${rds.totalDistance}');
}

void callMatrix() async {
  var points = <Map>[];
  String apiKey = "";
  points.add({'lat': 9.005980058445639, 'lon': 38.785734616513466});
  points.add({'lat': 9.01166345564756, 'lon': 38.789008246478424});
  GebetaMapRequest gmr = new GebetaMapRequest();
  List<ResponseData> rs = await gmr.matrix(points, apiKey);
  for (int i = 0; i < rs.length; i++) {
    print(rs[i].message);
    print(rs[i].status);
    print(rs[i].totalDistance);
    print(rs[i].path);
    print("(------------------------------------------)");
  }
}

void callTss() async {
  var points = <Map>[];
  String apiKey = "";
  points.add({'lat': 9.005980058445639, 'lon': 38.785734616513466});
  points.add({'lat': 9.01166345564756, 'lon': 38.789008246478424});
  GebetaMapRequest gmr = new GebetaMapRequest();
  ResponseData rds = await gmr.tss(points, apiKey);
  print('Response message: ${rds.message}');
  print('Response status: ${rds.status}');
  print('path: ${rds.path}');
  print('distance: ${rds.totalDistance}');
}

void callOneToMany() async {
  var directionStart = new Map();
  directionStart["lat"] = 9.022528936095531;
  directionStart["lon"] = 38.80400061607361;
  var points = <Map>[];
  String apiKey = "";
  points.add({'lat': 9.005980058445639, 'lon': 38.785734616513466});
  points.add({'lat': 9.01166345564756, 'lon': 38.789008246478424});
  GebetaMapRequest gmr = new GebetaMapRequest();
  List<ResponseData> rs = await gmr.OneToMany(directionStart, points, apiKey);

  for (int i = 0; i < rs.length; i++) {
    print(rs[i].message);
    print(rs[i].status);
    print(rs[i].totalDistance);
    print(rs[i].path);
    print("(------------------------------------------)");
  }
}

void callGeoCode() async {
  String name = "kotebe 02";
  String apiKey =
      "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJkMTQyNmJjZTg3MzU4ZmEzYTc1NjRjMjY1YTA5MzZjYyIsImlhdCI6MTY2MjAxODUyMCwic3ViIjoidGFraXMiLCJpc3MiOiJ0YWtpIn0.xfH2ME-LYJ1enQpKMrPI4B-vnFZPGaEsg4rUEp95VqY";
  GebetaMapRequest gmr = new GebetaMapRequest();
  ResponseData rs = await gmr.geocode(name, apiKey);
  print(rs.data);
}

void main(List<String> arguments) async {
  // making geocoding request
  callGeoCode();
}
