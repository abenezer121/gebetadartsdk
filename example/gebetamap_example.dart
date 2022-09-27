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
  print('time: ${rds.totaltime}');
}

void callMatrix() async {
  String apiKey = "";
  List<List<double>> points = [
    [9.005980058445639, 38.785734616513466],
    [9.01166345564756, 38.789008246478424]
  ];

  GebetaMapRequest gmr = new GebetaMapRequest();
  List<List<ResponseData>> rs = await gmr.matrix(points, apiKey);
  for (int i = 0; i < rs.length; i++) {
    for (int j = 0; j < rs[i].length; j++) {
      print('Response message: ${rs[i][j].message}');
      print('Response status: ${rs[i][j].status}');
      print('path: ${rs[i][j].path}');
      print('distance: ${rs[i][j].totalDistance}');
      print('time: ${rs[i][j].totaltime}');
    }
  }
}

void callTss() async {
  String apiKey = "";
  List<List<double>> points = [
    [9.005980058445639, 38.785734616513466],
    [9.01166345564756, 38.789008246478424]
  ];

  GebetaMapRequest gmr = new GebetaMapRequest();
  ResponseData rds = await gmr.tss(points, apiKey);
  print('Response message: ${rds.message}');
  print('Response status: ${rds.status}');
  print('path: ${rds.path}');
  print('distance: ${rds.totalDistance}');
  print('time: ${rds.totaltime}');
}

void callOneToMany() async {
  var directionStart = new Map();
  directionStart["lat"] = 9.022528936095531;
  directionStart["lon"] = 38.80400061607361;
  List<List<double>> points = [
    [9.005980058445639, 38.785734616513466],
    [9.01166345564756, 38.789008246478424]
  ];
  String apiKey = "";

  GebetaMapRequest gmr = new GebetaMapRequest();
  List<ResponseData> rs = await gmr.OneToMany(directionStart, points, apiKey);

  for (int i = 0; i < rs.length; i++) {
    print('Response message: ${rs[i].message}');
    print('Response status: ${rs[i].status}');
    print('path: ${rs[i].path}');
    print('distance: ${rs[i].totalDistance}');
    print('time: ${rs[i].totaltime}');
  }
}

void callGeoCode() async {
  String name = "kotebe 02";
  String apiKey = "";
  GebetaMapRequest gmr = new GebetaMapRequest();
  ResponseData rs = await gmr.geocode(name, apiKey);
  print(rs.data);
}

void main(List<String> arguments) async {
  // making geocoding request
  //callOneToMany();
  //callGeoCode();
  //callDirection();
  //callMatrix();
  //callTss();
}
