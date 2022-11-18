import 'Pubspec.dart';

class Latest {
  Latest({
      this.version, 
      this.pubspec, 
      this.archiveUrl, 
      this.packageUrl, 
      this.url,});

  Latest.fromJson(dynamic json) {
    version = json['version'];
    pubspec = json['pubspec'] != null ? Pubspec.fromJson(json['pubspec']) : null;
    archiveUrl = json['archive_url'];
    packageUrl = json['package_url'];
    url = json['url'];
  }
  String? version;
  Pubspec? pubspec;
  String? archiveUrl;
  String? packageUrl;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['version'] = version;
    final pubspec = this.pubspec;
    if (pubspec != null) {
      map['pubspec'] = pubspec.toJson();
    }
    map['archive_url'] = archiveUrl;
    map['package_url'] = packageUrl;
    map['url'] = url;
    return map;
  }

}