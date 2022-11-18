class Environment {
  Environment({
      this.sdk, 
      this.flutter,});

  Environment.fromJson(dynamic json) {
    sdk = json['sdk'];
    flutter = json['flutter'];
  }
  String? sdk;
  String? flutter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sdk'] = sdk;
    map['flutter'] = flutter;
    return map;
  }

}