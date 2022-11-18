import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pubdev/card.dart';
import 'package:pubdev/generated/assets.dart';

import 'network/net_request.dart';

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
    final data = ref.watch(allPackageProvider);

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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Search Packages",
                      fillColor: Colors.white30,
                      filled: true,
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: Colors.white,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
