import 'package:flutter/cupertino.dart';
import 'Packages.dart';

class Pubapi with ChangeNotifier {
  Pubapi({
      this.nextUrl, 
      this.packages,});

  Pubapi.fromJson(dynamic json) {
    nextUrl = json['next_url'];
    if (json['packages'] != null) {
      packages = [];
      json['packages'].forEach((v) {
        packages?.add(Packages.fromJson(v));
      });
    }
  }
  String? nextUrl;
  List<Packages>? packages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['next_url'] = nextUrl;
    final packages = this.packages;
    if (packages != null) {
      map['packages'] = packages.map((v) => v.toJson()).toList();
    }
    return map;
  }

}