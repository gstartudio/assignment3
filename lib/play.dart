import 'package:flutter/material.dart';
import 'package:flutter_assignment3/home.dart';

class PlayMusic extends StatefulWidget {
  const PlayMusic({super.key,required this.musicInfo});
  final MusicModel musicInfo;
  @override
  State<PlayMusic> createState() => _PlayMusicState();
}

class _PlayMusicState extends State<PlayMusic> {
  double _time = 0;
  bool _playing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff303030),
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Image.asset(widget.musicInfo.photoName),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          widget.musicInfo.songName,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          widget.musicInfo.singerName,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.white,
              // 適用されてる領域
              inactiveTrackColor: Colors.grey,
              // 適用されていない領域
              trackHeight: 5,
              // スライダーの幅
              thumbColor: Colors.white,
              // つまみの色
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
              // つまみの大きさ
            ),
            child: Slider(
              onChanged: (value) {
                setState(() {
                  _time = value;
                });
              },
              value: _time,
            )),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '0:00',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                '5:00',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.skip_previous,color: Colors.white,size: 45,),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: IconButton(onPressed: (){setState(() {
                _playing = !_playing;
              });}, icon: Icon(
                _playing ? Icons.pause : Icons.play_arrow,
                size: 45,
              )),
            ),
            const Icon(Icons.skip_next,color: Colors.white,size: 45,)
          ],
        )
      ]),
      backgroundColor: const Color(0xff303030),
    );
  }
}
