import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pubdev/network/net_request.dart';
import 'card.dart';

class HomeData extends ConsumerWidget {


@override
Widget build(BuildContext context, WidgetRef ref) {
  final data = ref.watch(allPackageProvider);

return Expanded(
child: data.when(
data: (data) {
return Scaffold(
backgroundColor: Color(0xFFf5f5f7),
body: ListView(
children: [
...data.packages?.map((e) => ProductCard(package: e,)).toList()?? []
]
),
);
},
error: (err, s) => Text(err.toString()),
loading: () => Center(child: CircularProgressIndicator(),)
),
);
}
}




