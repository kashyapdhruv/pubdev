import 'Flutter.dart';

class Dependencies {
  Dependencies({
      this.flutter,});

  Dependencies.fromJson(dynamic json) {
    flutter = json['flutter'] != null ? Flutter.fromJson(json['flutter']) : null;
  }
  Flutter? flutter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    final flutter = this.flutter;
    if (flutter != null) {
      map['flutter'] = flutter.toJson();
    }
    return map;
  }

}