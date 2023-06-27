import 'package:flutter/cupertino.dart';

class FriendQutoes extends StatefulWidget {
  const FriendQutoes({Key? key}) : super(key: key);

  @override
  State<FriendQutoes> createState() => _FriendQutoesState();
}

class _FriendQutoesState extends State<FriendQutoes> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text("Explore"),
          leading: CupertinoButton(
            onPressed: null,
            child: Icon(
              CupertinoIcons.search,
            ),
          ),
          trailing: CupertinoButton(
              child: Icon(CupertinoIcons.profile_circled), onPressed: null),
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            child: Row(
              children: [
                CupertinoButton(
                  child: Text("Friend"),
                  onPressed: null,
                ),
                CupertinoButton(
                  child: Text("Friend"),
                  onPressed: null,
                ),
                CupertinoButton(
                  child: Text("Friend"),
                  onPressed: null,
                ),
                CupertinoButton(
                  child: Text("Friend"),
                  onPressed: null,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
