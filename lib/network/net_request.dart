import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pubdev/Api/Pubapi.dart';
import 'package:pubdev/SinglePackage/SinglePackage.dart';

final allPackageProvider = FutureProvider<Pubapi>((ref) async {
  final response = await http.get(
    Uri.parse('https://pub.dev/api/packages'),
  );
  return Pubapi.fromJson(jsonDecode(response.body));
});

final PackageProvider = FutureProvider.family<SinglePackage, String>((ref, packageid) async {
  final response = await http.get(
    Uri.parse('https://pub.dev/api/packages/$packageid'),
  );
  return SinglePackage.fromJson(jsonDecode(response.body));
});
