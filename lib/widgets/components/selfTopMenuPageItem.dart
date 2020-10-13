import 'package:flutter/cupertino.dart';

class SelfTopMenuPageItem extends StatelessWidget{
  final String urlIcon;
  final  String text;

  const SelfTopMenuPageItem({Key key, this.urlIcon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(urlIcon),
        SizedBox(height: 10,),
        Text(text)
      ],
    );
  }
}