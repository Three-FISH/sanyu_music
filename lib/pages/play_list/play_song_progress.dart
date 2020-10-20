import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanyu_music_master/widgets/common_text_style.dart';

class PlaySongProgress extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          SizedBox(width: 20,),
          Text(
            "0:33",
            style: smallNoteTextStyle,
          ),
          Expanded(
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 2,
              ),
              child: Slider(
                activeColor: Colors.white,
                inactiveColor: Colors.white30,
                value: 0.3,
                onChanged: (data){

                },
              ),

            ),
          ),
          Text(
            "13:33",
            style: smallNoteTextStyle,
          ),
          SizedBox(width: 20,),
        ],
      ),
    );
  }

}