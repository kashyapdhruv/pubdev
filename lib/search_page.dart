import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pubdev/SearchPackage/Search.dart';
import 'package:pubdev/search_provider.dart';

import 'generated/assets.dart';

class SearchPage extends ConsumerWidget {

  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            "Pub.dev",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Color(0xFFf2f2f2)),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final  searchProvider = ref.watch(SearchStateProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.assetsSearchBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: buildAppbar(),
        body: Expanded(
          child: StreamBuilder<Search?> (
            stream:  searchProvider.stream,
            builder: (context, searchdata) {
              if (searchdata.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } 
              if (!searchdata.hasData) {
                return Center(
                  child: Text('No Such Package', style: TextStyle(fontSize: 40),),
                );
              }
              return ListView(
                children: searchdata.data!.packages!
                    .map(
                      (e) => ListTile(
                    contentPadding:  EdgeInsets.only(left: 24.0),
                    title: Text(
                      e.package!.toUpperCase(),
                    ),
                    onTap: () {
                      context.push(
                          '/packageView?packageName=${e.package}');
                    },
                  ),
                )
                    .toList(),
              );
            }
          )
        ),
      ),
    );
  }
}
