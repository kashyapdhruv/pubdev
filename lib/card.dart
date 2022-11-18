import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pubdev/Api/Packages.dart';

class ProductCard extends ConsumerWidget {
  final Packages package;

  ProductCard({Key? key, required this.package}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(
      padding: EdgeInsets.all(5),
      height: 160,
      child: Card(
        color: Color(0xFFffffff),
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        child: InkWell(
          onTap: () {
            GoRouter.of(context).push('/Detail?packageid=${package.name}');
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${package.latest?.pubspec?.name}',
                  style: TextStyle(
                    color: Color(0xFF1572d3),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  '${package.latest?.pubspec?.description}',
                  maxLines: 2,
                  style: TextStyle(
                    color: Color(0xFf6f757d),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(
                      'v',
                    ),
                    SizedBox(width: 4,),
                    Text(
                      '${package.latest?.pubspec?.version}',
                      style: TextStyle(
                        color: Color(0xff5f86d8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
