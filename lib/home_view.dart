import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _imageUrl = "https://avatars.githubusercontent.com/u/61868498?v=4";
  String _randomImage = "https://picsum.photos/200";
  String _dummyText =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu interdum elit, in commodo nisl. Maecenas tristique justo et vestibulum mollis. Mauris pretium risus quam, non vulputate nulla accumsan vitae. Sed vehicula lacus id dui ullamcorper, et egestas nunc tincidunt. Aliquam sit amet odio et neque ornare cursus. Nam tortor lectus.";
  String _commentCount = "22";
  bool _isHeaderClose = true;
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      print(scrollController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: _buildAppBar(),
            floatingActionButton: _buildFabButton(),
            body: Column(
              children: [_buildExpandedListView()],
            )),
      ),
    );
  }

  Expanded _buildExpandedListView() {
    return Expanded(
      child: _buildlistView(),
    );
  }

  ListView _buildlistView() {
    return ListView.builder(
        itemCount: 10,
        controller: scrollController,
        itemBuilder: (context, index) {
          return _buildlistViewCard();
        });
  }

  Card _buildlistViewCard() {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(_randomImage),
        ),
        title: Wrap(
          runSpacing: 5,
          children: [
            _buildListCardTitle(),
            Text(_dummyText),
            Container(height: 100, child: Placeholder()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconLabelButton(_commentCount),
                _buildIconLabelButton(_commentCount),
                _buildIconLabelButton(_commentCount),
                _buildIconLabelButton(_commentCount),
              ],
            )
          ],
        ),
      ),
    );
  }

  InkWell _buildIconLabelButton(_commentCount) => InkWell(
        child: _buildIconLabel(_commentCount),
        onTap: () {},
      );

  Wrap _buildIconLabel(_commentCount) =>
      Wrap(children: [Icon(Icons.comment,color:CupertinoColors.inactiveGray), Text(_commentCount)]);

  Text _buildListCardTitle() => Text(
        "Hello",
        style: titleTextStyle,
      );

  TabBar _buildTabBar() {
    return TabBar(
      tabs: [
        Tab(
            icon: Icon(
          Icons.home,
        )),
        Tab(icon: Icon(Icons.search)),
        Tab(icon: Icon(Icons.notifications)),
        Tab(icon: Icon(Icons.message_outlined)),
      ],
    );
  }

  Widget get _appBarItems => Wrap(
        spacing: 20,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CircleAvatar(backgroundImage: NetworkImage(_imageUrl)),
          Text("Home", style: titleTextStyle)
        ],
      );
  AppBar _buildAppBar() {
    return AppBar(
    title: Container(child: _appBarItems,),
      actions: [],
      bottom: _buildTabBar(),
    );
  }

  FloatingActionButton _buildFabButton() =>
      FloatingActionButton(onPressed: () {}, child: Icon(Icons.add));
}

final titleTextStyle = TextStyle(
    letterSpacing: 1,
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: Colors.black);
