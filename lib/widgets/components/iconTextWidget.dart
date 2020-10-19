import 'package:flutter/cupertino.dart';

class IconTextWidget extends StatelessWidget{
  final String image;
  final double size;
  final VoidCallback onTap;

  const IconTextWidget(this.image, this.size, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Image.asset(
          image,
          width: size,
          height: size,
        ),
        onTap: onTap,
      ),
    );
  }

}