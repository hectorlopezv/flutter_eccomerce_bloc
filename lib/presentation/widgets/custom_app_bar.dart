import 'package:flutter/material.dart';

class ScrollableAppBar extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ScrollableAppBar(
      {Key? key, required this.children, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, isScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              minimum: EdgeInsets.all(4),
              sliver: SliverAppBar(
                automaticallyImplyLeading: false,
                title: Container(
                  color: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 100,
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
                iconTheme: const IconThemeData(color: Colors.black),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.star),
                    onPressed: () {
                      Navigator.pushNamed(context, "/wish_list");
                    },
                  ),
                ],
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ),
        ];
      },
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return children[index];
        },
        itemCount: children.length,
      ),
    );
  }
}
