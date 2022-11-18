import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pubdev/SearchPackage/Search.dart';

class SearchProvider extends StateNotifier<Search?> {
  SearchProvider() : super(null);

  Search? get searchresult => state;

  Future<void> search({
  required int page,
  required String query,
}) async {
    if (query.isEmpty) {
      state = null;
      return;
    }

    final response = await http.get(
      Uri.parse('https://pub.dartlang.org/api'),
      '/search',
      headers: {
        'page' : '$page',
        'q' : query
      }
    );

    state = Search.fromJson(response.data);
  }
}

final SearchStateProvider = StateNotifierProvider<SearchProvider, Search? >((ref) {
  return SearchProvider();
});

