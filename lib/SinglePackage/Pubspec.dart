import 'Environment.dart';
import 'Dependencies.dart';
import 'DevDependencies.dart';

class Pubspec {
  Pubspec({
      this.name, 
      this.description, 
      this.version, 
      this.author, 
      this.homepage, 
      this.environment, 
      this.dependencies, 
      this.devDependencies,});

  Pubspec.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    version = json['version'];
    author = json['author'];
    homepage = json['homepage'];
    environment = json['environment'] != null ? Environment.fromJson(json['environment']) : null;
    dependencies = json['dependencies'] != null ? Dependencies.fromJson(json['dependencies']) : null;
    devDependencies = json['dev_dependencies'] != null ? DevDependencies.fromJson(json['dev_dependencies']) : null;
  }
  String? name;
  String? description;
  String? version;
  dynamic author;
  dynamic homepage;
  Environment? environment;
  Dependencies? dependencies;
  DevDependencies? devDependencies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    map['version'] = version;
    map['author'] = author;
    map['homepage'] = homepage;
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
    return map;
  }

}