import 'package:example/common/item_builder.dart';
import 'package:example/common/tu_chong_repository.dart';
import 'package:example/common/tu_chong_source.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:ff_annotation_route/ff_annotation_route.dart';

@FFRoute(
    name: "fluttercandies://GridViewDemo",
    routeName: "GridView",
    description: "Show how to build loading more GridView quickly")
class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  TuChongRepository listSourceRepository;
  @override
  void initState() {
    listSourceRepository = new TuChongRepository();
    super.initState();
  }

  @override
  void dispose() {
    listSourceRepository?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("GridViewDemo"),
          ),
          Expanded(
            child: 
            LoadingMoreList(
              ListConfig<TuChongItem>(
                itemBuilder: ItemBuilder.itemBuilder,
                sourceList: listSourceRepository,
                padding: EdgeInsets.all(0.0),
                lastChildLayoutType: LastChildLayoutType.foot,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 3.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
