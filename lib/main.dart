import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:sanyu_music_master/pages/play_list/play_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider/user_model.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<UserModel>(
          create: (_) => UserModel(),
        ),
      ],
     child:MyApp()
  ));
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loading=false;
  bool hasToken=false;
  @override
  void initState() {
    _notFoundToken();
    super.initState();
  }
  _notFoundToken()async{
    setState(() {
      loading=true;
    });
    SharedPreferences sp=await SharedPreferences.getInstance();
    setState(() {
      loading=false;
    });
    hasToken=sp.getString('cookie')==null;
  }
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child:new MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:loading?Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ):hasToken? PlayListPage():PlayListPage(),
      ),
    );
  }
}

