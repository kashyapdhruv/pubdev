import 'package:flutter/cupertino.dart';

import 'Latest.dart';

class Packages with ChangeNotifier {
  Packages({
      this.name,
      this.latest,});

  Packages.fromJson(dynamic json) {
    name = json['name'];
    latest = json['latest'] != null ? Latest.fromJson(json['latest']) : null;
  }
  String? name;
  Latest? latest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    final latest = this.latest;
    if (latest != null) {
      map['latest'] = latest.toJson();
    }
    return map;
  }

}