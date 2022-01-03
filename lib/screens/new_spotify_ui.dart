import 'package:flutter/material.dart';
import 'package:spotify_flutter/widgets/list_items/song_item.dart';

import '../models/song.dart';

class NewSpotifyUi extends StatefulWidget {
  const NewSpotifyUi({Key? key}) : super(key: key);

  @override
  _NewSpotifyUiState createState() => _NewSpotifyUiState();
}

class _NewSpotifyUiState extends State<NewSpotifyUi> {
  bool isSwitched = false;
  var isOn = true;
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
            Row(
              children: <Widget>[],
            ),
            buildAlbumImage(),
            buildAlbumTitle(),
            buildDownloadSection(),
            buildAddSongButton(),
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
      padding: EdgeInsets.only(left: 10.0, right: 16.0, top: 4.0, bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: Text(
              'Zenginleştir',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.only(top: 16.0),
            padding:
                EdgeInsets.only(left: 13.0, right: 16.0, top: 4.0, bottom: 4.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.transparent,
                border: Border.all(color: Colors.grey, width: 1.0)),
          ),
          Icon(Icons.download_outlined, color: Colors.green, size: 32),
          Icon(Icons.person_add_alt_1_outlined, color: Colors.grey, size: 28),
          Icon(Icons.more_vert, color: Colors.grey, size: 28),
          // Icon(Icons.pause_circle_filled, color: Color(0xFF2AB859), size: 50),
          InkWell(
            onTap: () => setState(() => isOn = !isOn),
            child: isOn ? SwitchOnIconWidget() : SwitchOffIconWidget(),
          ),
          /*Switch(
            activeTrackColor: Colors.green,
            activeColor: Colors.green,
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),*/
        ],
      ),
    );
  }

  SwitchOffIconWidget() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Icon(
          Icons.play_circle_fill_outlined,
          color: Color(0xFF2AB859),
          size: 70,
        ),
        Positioned(
          height: 30,
          width: 30,
          left: 30,
          top: 35,
          child: Icon(
            Icons.repeat_one_sharp,
            color: Colors.black,
            size: 28,
          ),
        ),
      ],
    );
  }

  SwitchOnIconWidget() {
    return Icon(
      Icons.pause_circle_filled,
      color: Color(0xFF2AB859),
      size: 60,
    );
  }

  Padding buildAddSongButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: OutlinedButton(
        onPressed: () {},
        child: Text('   Şarkı Ekle   ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            )),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: Colors.white,
          side: BorderSide(
            width: 2.0,
            color: Colors.grey,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
        ),
      ),
    );
  }

  Padding buildAlbumImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: 250.0,
          height: 250.0,
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

  Padding buildAlbumTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Çalma Listem',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                radius: 15.0,
                backgroundImage: AssetImage("assets/album_image.png"),
              ),
              SizedBox(width: 10),
              Text(
                'Nuri',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            '57 dk',
            style: TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
          ),
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
          colors: [Color(0xF453D3B), Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.center,
          tileMode: TileMode.clamp),
    );
  }
}
