import 'Packages.dart';

class Search {
  Search({
      this.packages, 
      this.next,});

  Search.fromJson(dynamic json) {
    if (json['packages'] != null) {
      packages = [];
      json['packages'].forEach((v) {
        packages?.add(Packages.fromJson(v));
      });
    }
    next = json['next'];
  }
  List<Packages>? packages;
  String? next;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    final packages = this.packages;
    if (packages != null) {
      map['packages'] = packages.map((v) => v.toJson()).toList();
    }
    map['next'] = next;
    return map;
  }

}