import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pubdev/SearchPackage/Search.dart';

class SearchState extends StateNotifier<Search?> {
  SearchState() : super(null);

  static const _scheme = 'https';
  static const _host = 'pub.dartlang.org';
  Search? get searchResults => state;
  Future<Search?> search({
    required int page,
    required String query,
  }) async {
    if (query.isEmpty) {
      state = null;
    }

    final dio = Dio();
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      path: 'api/Search',
      queryParameters: <String, String>{'page': '$page', 'q': query},
    );

    final response = await dio.getUri(
      uri,
    );

    state = Search.fromJson(response.data);
    return state;

    // Returns {packages: [{ package: string }]}
  }
}

final searchStateProvider =
StateNotifierProvider<SearchState, Search?>((ref) {
  return SearchState();
});