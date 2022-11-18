class Packages {
  Packages({
      this.package,});

  Packages.fromJson(dynamic json) {
    package = json['package'];
  }
  String? package;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['package'] = package;
    return map;
  }

}