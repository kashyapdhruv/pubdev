import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pubdev/generated/assets.dart';
import 'package:pubdev/home_data.dart';
import 'package:pubdev/search_provider.dart';

import 'SearchPackage/Search.dart';

class HomePage extends ConsumerWidget {


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
    final SearchProvider = ref.watch(searchStateProvider.notifier);

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
        body: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  SearchProvider.search(page: 0, query: value);
                },
                decoration: InputDecoration(
                    hintText: "Search Packages",
                    fillColor: Colors.white30,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(CupertinoIcons.search),
                      color: Colors.white,
                      onPressed: () {
                        GoRouter.of(context).replace('/Search');
                        ref.refresh(searchStateProvider.notifier).stream;
                      },
                    ),
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Supported by',
                    style: TextStyle(fontSize: 16, color: Color(0xFF838c91)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Google',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF838c91)),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: StreamBuilder<Search?> (
                    stream:  SearchProvider.stream,
                    builder: (context, searchdata) {
                      if (searchdata.connectionState == ConnectionState.waiting) {
                        return HomeData();
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
                            contentPadding: EdgeInsets.only(left: 24.0),
                            title: Text(
                              e.package!.toString(),
                            ),
                            onTap: () {
                              context.push('/Detail?packageid=${e.package}');
                            },
                          ),
                        )
                            .toList(),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

