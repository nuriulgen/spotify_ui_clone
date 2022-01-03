import 'package:flutter/material.dart';
import 'package:spotify_flutter/screens/new_spotify_ui.dart';

void main() => runApp(SpotifyApp());

class SpotifyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify',
      home: NewSpotifyUi(),
    );
  }
}
