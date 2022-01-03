import 'package:flutter/material.dart';
import 'package:spotify_flutter/widgets/list_items/song_item.dart';

import '../models/song.dart';

class OldSpotifyUi extends StatefulWidget {
  const OldSpotifyUi({Key? key}) : super(key: key);

  @override
  _OldSpotifyUiState createState() => _OldSpotifyUiState();
}

class _OldSpotifyUiState extends State<OldSpotifyUi> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    List<SongItem> songItems = generateSongList();
    return Scaffold(
      backgroundColor: Colors.brown.shade500,
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNavigationBar(context),
      body: Container(
        decoration: buildGradientDecoration(),
        child: Column(
          children: [
            buildAlbumImage(),
            buildAlbumTitle(),
            buildFollowButton(),
            buildFollowerCountText(),
            SizedBox(height: 10),
            buildTwoBlank(),
            SizedBox(height: 15),
            buildShufflePlayButton(),
            SizedBox(height: 15),
            buildDownloadSection(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    songItems[index],
                itemCount: songItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<SongItem> generateSongList() {
    List<SongItem> songItems = [
      SongItem(Song(name: 'The Fear', artist: 'The Score')),
      SongItem(Song(
          name: 'Into Your Arms (feat.Ava Max)',
          artist: 'Witt Lowry • Into Your Arms (feat.Ava M...')),
      SongItem(Song(
          name: 'love nwantiti (feat.ElGrande...',
          artist: 'Wolfgang Amadeus Mozart, Howard Shelley, London M...')),
      SongItem(Song(name: 'Animals', artist: 'Maroon 5')),
      SongItem(Song(
          name: 'Montero (Call Me By Your Name)...',
          artist: 'Lil Nas X • Montero')),
      SongItem(Song(name: 'The Monster', artist: 'Eminem, Rihanna')),
      SongItem(Song(name: 'Counting Stars', artist: 'One Repulic')),
    ];
    return songItems;
  }

  Padding buildDownloadSection() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              'Download',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                print(isSwitched);
              });
            },
            activeTrackColor: Colors.green,
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Row buildTwoBlank() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
        SizedBox(width: 3),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Container buildShufflePlayButton() {
    return Container(
      child: Text(
        'SHUFFLE PLAY',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      padding:
          EdgeInsets.only(left: 40.0, right: 40.0, top: 16.0, bottom: 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xFF2AB859),
          border: Border.all(color: Color(0xFF2AB859), width: 1.0)),
    );
  }

  Text buildFollowerCountText() {
    return Text(
      'BY SPOTIFY • 349,724 FOLLOWERS',
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }

  OutlinedButton buildFollowButton() {
    return OutlinedButton(
      onPressed: () {},
      child: Text('   FOLLOW   ',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          )),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        onPrimary: Colors.white,
        side: BorderSide(
          width: 1.0,
          color: Colors.grey,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
      ),
    );
  }

  Text buildAlbumTitle() {
    return Text(
      'This Is Mozart',
      style: TextStyle(
          fontSize: 21, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Padding buildAlbumImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          child: Image.asset(
            'assets/album_image.png',
            fit: BoxFit.contain,
          ),
          decoration: BoxDecoration(),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFFA35D59),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
    );
  }

  Theme buildBottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF222326),
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: Colors.grey))),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Your Library',
          ),
        ],
        currentIndex: 2,
        fixedColor: Colors.white,
        onTap: null,
      ),
    );
  }

  BoxDecoration buildGradientDecoration() {
    return BoxDecoration(
      gradient: new LinearGradient(
          colors: [Color(0xFFA35D59), Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.center,
          tileMode: TileMode.clamp),
    );
  }
}
