import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sanyu_music_master/global.dart';
import 'package:sanyu_music_master/pages/home/home_page.dart';
import 'package:sanyu_music_master/utils/net_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    Future.delayed(Duration(milliseconds: 500), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 80,
            right: 80,
            top: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'images/music_logo.png',
                  width: 80,
                  height: 80,
                ),
              ),
              _LoginAnimatedWidget(
                animation: _animation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginAnimatedWidget extends AnimatedWidget {
  final Tween<double> _opacityTween = Tween(begin: 0, end: 1);
  final Tween<double> _offsetTween = Tween(begin: 40, end: 0);
  final Animation animation;

  _LoginAnimatedWidget({
    @required this.animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        margin: EdgeInsets.only(top: _offsetTween.evaluate(animation)),
        child: _LoginWidget(),
      ),
    );
  }
}

class _LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return __LoginWidgetState();
  }
}

class __LoginWidgetState extends State<_LoginWidget> {
  String _phone;
  String _password;
  final TextEditingController _phoneController = TextEditingController(text:'15034553552');
  final TextEditingController _pwdController = TextEditingController(text:'wangyao123');

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(primaryColor: Colors.red),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                'Welcome Back!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 34,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'This is a Music App',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            _inputStyle(_phoneController, "+86 请输入手机号码", Icons.phone_iphone,
                (val) {
              _phone = val;
            }, false),
            SizedBox(
              height: 40,
            ),
            _inputStyle(_pwdController, "请输入密码", Icons.lock, (val) {
              _password = val;
            }, true),
            SizedBox(
              height: 80,
            ),
            FlatButton(
              minWidth: double.infinity,
              height: 40,
              onPressed: () async {
                _phone =_phoneController.text;
                _password=_pwdController.text;
                if (_phone == '') {
                  showToast('请输入手机号');
                  return;
                }
                if (_password == '') {
                  showToast('请输入密码');
                  return;
                }
                String myUrl =
                    "$API_PREFIX/login/cellphone?phone=$_phone&password=$_password";
                final response = await DioUtil.getInstance()
                    .post(myUrl, {'username': _phone, 'password': _password});
                print(response);
                final data = response.data;
                if (data['code'] == 200) {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  data['profile'].forEach((String key, value) {
                    prefs.setString(key, value.toString());
                  });
                  prefs.setString('cookie', data['token']);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return HomePage();
                  }));
                } else {
                  showToast(response.data['message']);
                }
              },
              color: Colors.red,
              splashColor: Colors.red[700],
              child: Text('登录',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            )
            /* Consumer<UserModel>(
              builder: (BuildContext context, UserModel value, Widget child) {
                return  ;
              },
            )*/
          ],
        ));
  }

  _inputStyle(TextEditingController controller, hintText, iconData, onChanged,
      obscureText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          iconData,
          color: Colors.black26,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black26),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
      ),
      obscureText: obscureText,
      cursorColor: Theme.of(context).primaryColor,
      autofocus: true,
      style: TextStyle(color: Colors.black87),
      onChanged: onChanged,
    );
  }
}
