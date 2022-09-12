
A composable, Future-based library for making HTTP requests to GebetaMap.

This package contains a set of high-level functions that make it
easy to consume HTTP resources from GebetaMap. It's multi-platform, and supports mobile, desktop,
and the browser.

## Using
making direction request to gebeta map
```dart
import 'package:gebetamap/gebetamap.dart';
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
    print('Response body: ${rds.path}');

```

making travels salesman request to gebeta map

```dart
import 'package:gebetamap/gebetamap.dart';
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
```

making one to many request 
```dart
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
```



making Geocoding request
``` dart
    String name = "kotebe 02";
    String apiKey = "";
    GebetaMapRequest gmr = new GebetaMapRequest();
    ResponseData rs = await gmr.geocode(name, apiKey);
    print(rs.data);
```


