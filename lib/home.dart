import 'package:flutter/material.dart';
import 'package:flutter_assignment3/play.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MusicModel song1 = MusicModel(
      photoName: 'assets/images/arujanon.png',
      songName: 'アルジャーノン',
      singerName: 'ヨルシカ');
  MusicModel song2 = MusicModel(
      photoName: 'assets/images/dakara.png',
      songName: 'だから僕は音楽をやめた',
      singerName: 'ヨルシカ');
  MusicModel song3 = MusicModel(
      photoName: 'assets/images/makeinu.png',
      songName: '負け犬にアンコールはいらない',
      singerName: 'ヨルシカ');
  MusicModel song4 = MusicModel(
      photoName: 'assets/images/matasaburou.png',
      songName: '又三郎',
      singerName: 'ヨルシカ');
  MusicModel song5 = MusicModel(
      photoName: 'assets/images/shayou.png',
      songName: '斜陽',
      singerName: 'ヨルシカ');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff424242),
        title: const Text(
          'ホーム',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'あなたへのおすすめ',
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Container(
              height: 250,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  MusicTile(musicInfo: song1),
                  MusicTile(musicInfo: song2),
                  MusicTile(musicInfo: song3),
                  MusicTile(musicInfo: song4),
                  MusicTile(musicInfo: song5),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'カテゴリー',
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 280,
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.25,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                              Color(0xff653071),
                              Color(0xff161516)
                            ])),
                        child: const Center(
                          child: Text(
                            'クラシック',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                              Color(0xffF3D644),
                              Color(0xff7D5345)
                            ])),
                        child: const Center(
                          child: Text(
                            'カントリー',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Color(0xffF94258)),
                        child: const Center(
                          child: Text(
                            'ポップ',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Color(0xff2DA7F9)),
                        child: const Center(
                          child: Text(
                            'ロック',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Color(0xff85E150)),
                        child: const Center(
                          child: Text(
                            'ジャパン',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Color(0xffF14D48)),
                        child: const Center(
                          child: Text(
                            'パンク',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xFF303030),
    );
  }
}

class MusicTile extends StatelessWidget {
  const MusicTile({super.key, required this.musicInfo});

  final MusicModel musicInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PlayMusic(musicInfo: musicInfo))),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                    width: 170,
                    height: 170,
                    child: Image.asset(musicInfo.photoName))),
            Text(
              musicInfo.songName,
              style: const TextStyle(
                  color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
            ),
            Text(
              musicInfo.singerName,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class MusicModel {
  MusicModel(
      {required this.photoName,
      required this.songName,
      required this.singerName});

  final String photoName;
  final String songName;
  final String singerName;
}
