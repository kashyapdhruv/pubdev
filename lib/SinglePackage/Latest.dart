import 'Pubspec.dart';

class Latest {
  Latest({
      this.version, 
      this.pubspec, 
      this.archiveUrl, 
      this.archiveSha256, 
      this.published,});

  Latest.fromJson(dynamic json) {
    version = json['version'];
    pubspec = json['pubspec'] != null ? Pubspec.fromJson(json['pubspec']) : null;
    archiveUrl = json['archive_url'];
    archiveSha256 = json['archive_sha256'];
    published = json['published'];
  }
  String? version;
  Pubspec? pubspec;
  String? archiveUrl;
  String? archiveSha256;
  String? published;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['version'] = version;
    final pubspec = this.pubspec;
    if (pubspec != null) {
      map['pubspec'] = pubspec.toJson();
    }
    map['archive_url'] = archiveUrl;
    map['archive_sha256'] = archiveSha256;
    map['published'] = published;
    return map;
  }

}