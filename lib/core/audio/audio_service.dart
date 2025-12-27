// ignore_for_file: avoid_print

import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioPlayer _player = AudioPlayer();

  /// Play pronunciation audio from a URL
  static Future<void> play(String url) async {
    if (url.isEmpty) return;

    try {
      await _player.stop(); // stop previous audio if any
      await _player.play(UrlSource(url));
    } catch (e) {
      // ignore audio errors to prevent app crash
      print("Audio error: $e");
    }
  }
}
