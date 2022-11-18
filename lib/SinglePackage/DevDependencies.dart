class DevDependencies {
  DevDependencies({
      this.mockito, 
      this.test, 
      this.freezed, 
      this.buildRunner, 
      this.trotter,});

  DevDependencies.fromJson(dynamic json) {
    mockito = json['mockito'];
    test = json['test'];
    freezed = json['freezed'];
    buildRunner = json['build_runner'];
    trotter = json['trotter'];
  }
  String? mockito;
  String? test;
  String? freezed;
  String? buildRunner;
  String? trotter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mockito'] = mockito;
    map['test'] = test;
    map['freezed'] = freezed;
    map['build_runner'] = buildRunner;
    map['trotter'] = trotter;
    return map;
  }

}