import 'Environment.dart';
import 'Dependencies.dart';
import 'DevDependencies.dart';

class Pubspec {
  Pubspec({
      this.name, 
      this.description, 
      this.version, 
      this.homepage, 
      this.repository, 
      this.environment, 
      this.dependencies, 
      this.devDependencies, 
      this.flutter,});

  Pubspec.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    version = json['version'];
    homepage = json['homepage'];
    repository = json['repository'];
    environment = json['environment'] != null ? Environment.fromJson(json['environment']) : null;
    dependencies = json['dependencies'] != null ? Dependencies.fromJson(json['dependencies']) : null;
    devDependencies = json['dev_dependencies'] != null ? DevDependencies.fromJson(json['dev_dependencies']) : null;
    flutter = json['flutter'];
  }
  String? name;
  String? description;
  String? version;
  String? homepage;
  String? repository;
  Environment? environment;
  Dependencies? dependencies;
  DevDependencies? devDependencies;
  dynamic flutter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    map['version'] = version;
    map['homepage'] = homepage;
    map['repository'] = repository;
    final environment = this.environment;
    if (environment != null) {
      map['environment'] = environment.toJson();
    }
    final dependencies = this.dependencies;
    if (dependencies != null) {
      map['dependencies'] = dependencies.toJson();
    }
    final devDependencies = this.devDependencies;
    if (devDependencies != null) {
      map['dev_dependencies'] = devDependencies.toJson();
    }
    map['flutter'] = flutter;
    return map;
  }

}