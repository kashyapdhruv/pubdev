import 'Latest.dart';
import 'Versions.dart';

class SinglePackage {
  SinglePackage({
      this.name, 
      this.latest, 
      this.versions,});

  SinglePackage.fromJson(dynamic json) {
    name = json['name'];
    latest = json['latest'] != null ? Latest.fromJson(json['latest']) : null;
    if (json['versions'] != null) {
      versions = [];
      json['versions'].forEach((v) {
        versions?.add(Versions.fromJson(v));
      });
    }
  }
  String? name;
  Latest? latest;
  List<Versions>? versions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    final latest = this.latest;
    if (latest != null) {
      map['latest'] = latest.toJson();
    }
    final versions = this.versions;
    if (versions != null) {
      map['versions'] = versions.map((v) => v.toJson()).toList();
    }
    return map;
  }

}