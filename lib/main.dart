import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: Main()));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Order details"),
            pinned: true,
            floating: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://sun9-23.userapi.com/impg/wZ83GkPGQPfctujZvlJ3fT-wMf6-1Qryw7vEJA/kef0En54ST8.jpg?size=1200x800&quality=96&sign=087a0c9bb61b1e6cb3002ee94d5033ed&type=album",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 20.0,
              maxHeight: 120.0,
              child: Container(
                color: const Color.fromARGB(255, 223, 196, 19),
                child: Row(
                  children: [Text("Popular"), Spacer(), Text("See all")],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.65,
              ),
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.network(
                            "https://sun9-23.userapi.com/impg/wZ83GkPGQPfctujZvlJ3fT-wMf6-1Qryw7vEJA/kef0En54ST8.jpg?size=1200x800&quality=96&sign=087a0c9bb61b1e6cb3002ee94d5033ed&type=album",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "\$26.15",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(width: 70),
                                Icon(Icons.favorite_border),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Pull & Bear Men's Clothes",
                              style: TextStyle(fontSize: 14),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }, childCount: 6),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 20.0,
              maxHeight: 120.0,
              child: Container(
                color: Colors.green,
                child: Row(
                  children: [Text("Men's Fashion"), Spacer(), Text("See all")],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://frankfurt.apollo.olxcdn.com/v1/files/0b3whdhw82un-UZ/image",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListTile(
                  title: Text("Men's Fashion Collection"),
                  subtitle: Text("Discount up to 60 %"),
                ),
              );
            }, childCount: 20),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
