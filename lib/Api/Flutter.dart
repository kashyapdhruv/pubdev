class Flutter {
  Flutter({
      this.sdk,});

  Flutter.fromJson(dynamic json) {
    sdk = json['sdk'];
  }
  String? sdk;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sdk'] = sdk;
    return map;
  }

}