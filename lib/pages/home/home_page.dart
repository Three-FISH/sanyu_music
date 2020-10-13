import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sanyu_music_master/widgets/components/smartDrawer.dart';
import 'video_page.dart';
import 'cloudEvent_page.dart';
import 'discover.dart';
import 'my_page.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}
class _HomePage extends State<HomePage> with TickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this,initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Stack(
            children:<Widget> [
              Positioned(
                  left: 6,
                  child:IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: (){
                      _scaffoldKey.currentState.openDrawer();
                    },
                  )),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 70) ,
                child: TabBar(
                  labelStyle: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                  unselectedLabelStyle: TextStyle(fontSize: 14,color: Colors.black),
                  indicator: UnderlineTabIndicator(),
                  controller: _tabController,
                  tabs: [
                    Tab(
                      text: '我的',
                    ),
                    Tab(
                      text: '发现',
                    ),
                    Tab(
                      text: '云村',
                    ),
                    Tab(
                      text: '视频',
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 6,
                child:IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: (){
                    showToast("点击搜索按钮",textStyle: TextStyle(fontSize: 18,color: Colors.white),backgroundColor: Colors.grey,radius: 4);
                  },
                )),
            ],
          )
        ),
      ),
      drawer: new MyDrawer(),
      body: getTabbarPages(),
    );
  }
  Widget getTabbarPages(){
    return TabBarView(controller: _tabController, children: <Widget>[
      MyPage(),
      DiscoverPage(),
      CloudEventPage(),
      VideoPage()
    ]);
  }
}
class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SmartDrawer(
      widthPercent: 0.9,
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Padding(
                padding: const EdgeInsets.only(top: 38),
                child:Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: ClipOval(
                        child: Image.asset("images/music_logo.png",width: 80),
                      ),
                    ),
                    Text("sanyu",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                  ],
                ) ,
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text("Add account"),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text("Manage accounts"),
                    ),
                    ListTile(
                      leading: const Icon(Icons.account_balance_outlined),
                      title: const Text("About us"),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

}