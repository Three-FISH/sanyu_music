import 'dart:async';

import 'package:flutter/material.dart';

class CustomBanner extends StatefulWidget {
  final List<String> _images;
  final double height;
  //用户点击的回调，是一个 ValueChanged<int>，回调一个 index
  final ValueChanged<int> onTap;
  //图片在切换时候的效果，默认为 Curves.linear
  final Curve curve;

  CustomBanner(
      this._images, {
        this.height = 200,
        this.onTap,
        this.curve = Curves.linear,
      }) : assert(_images != null);

  @override
  _CustomBannerState createState() => _CustomBannerState();
}

class _CustomBannerState extends State<CustomBanner> {
  PageController _pageController;
  int _curIndex;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _curIndex = widget._images.length * 5;
    _pageController = PageController(initialPage: _curIndex);
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _buildPageView(),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() {
    var length = widget._images.length;
    return Positioned(
      bottom: 10,
      child: Row(
        children: widget._images.map((s) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: ClipOval(
              child: Container(
                width: 8,
                height: 8,
                color: s == widget._images[_curIndex % length]
                    ? Colors.red
                    : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPageView() {
    var length = widget._images.length;
    return AspectRatio(
      aspectRatio: 2.57/ 1,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _curIndex = index;
            if (index == 0) {
              _curIndex = length;
              _changePage();
            }
          });
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onPanDown: (details) {
              _cancelTimer();
            },
            onTap: () {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('当前 page 为 ${index % length}'),
                  duration: Duration(milliseconds: 500),
                ),
              );
            },
            child: Image.network(
              widget._images[index % length],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  /// 点击到图片的时候取消定时任务
  _cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
      _initTimer();
    }
  }

  /// 初始化定时任务
  _initTimer() {
    if (_timer == null) {
      //duration：指隔多长时间执行一次,callback：时间到的时候执行的任务
      _timer = Timer.periodic(Duration(seconds: 3), (t) {
        _curIndex++;
        _pageController.animateToPage(
          //跳转的页面
          _curIndex,
          //跳转到该页面动画持续时间（也就是多长时间能翻到该页）
          duration: Duration(milliseconds: 300),
          //动画的效果
          curve: Curves.linear,
        );
      });
    }
  }

  /// 切换页面，并刷新小圆点
  _changePage() {
    Timer(Duration(milliseconds: 350), () {
      _pageController.jumpToPage(_curIndex);
    });
  }
}