import 'FlutterTest.dart';

class DevDependencies {
  DevDependencies({
      this.flutterTest, 
      this.flutterLints,});

  DevDependencies.fromJson(dynamic json) {
    flutterTest = json['flutter_test'] != null ? FlutterTest.fromJson(json['flutter_test']) : null;
    flutterLints = json['flutter_lints'];
  }
  FlutterTest? flutterTest;
  String? flutterLints;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    final flutterTest = this.flutterTest;
    if (flutterTest != null) {
      map['flutter_test'] = flutterTest.toJson();
    }
    map['flutter_lints'] = flutterLints;
    return map;
  }

}