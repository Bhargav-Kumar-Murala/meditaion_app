import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  Duration _duration = const Duration();
  Duration _position = const Duration();

  bool isPlaying = false;
  bool isPaused = false;

  late Uri url;

  @override
  void initState() {
    super.initState();
    _startPlayer();
    audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });
  }

  _startPlayer() async {
    url = await audioCache.load('slowmotion.mp3');
    await audioPlayer.setUrl(url.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2d31ac),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Mental Training'),
        actions: [
          IconButton(
              onPressed: () {
                audioPlayer.stop();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: const Color(0xff2d31ac),
        child: Column(
          children: [
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.favorite_outline, color: Colors.white),
                IconButton(
                    color: Colors.white,
                    iconSize: 60,
                    onPressed: () {
                      if (isPlaying == false) {
                        audioPlayer.play(url.toString());
                        setState(() {
                          isPlaying = true;
                        });
                      } else if (isPlaying == true) {
                        audioPlayer.pause();
                        setState(() {
                          isPlaying = false;
                        });
                      }
                    },
                    icon: isPlaying == false
                        ? const Icon(Icons.play_circle_outlined)
                        : const Icon(Icons.pause_circle_outlined)),
                const Icon(Icons.tune_outlined, color: Colors.white)
              ],
            ),
            Slider(
                activeColor: Colors.white,
                inactiveColor: const Color(0x4c000000),
                value: _position.inSeconds.toDouble(),
                min: 0.0,
                max: _duration.inSeconds.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    changeToSecond(value.toInt());
                    value = value;
                  });
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  intToTime(_position.inSeconds),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  intToTime(_duration.inSeconds),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    audioPlayer.seek(newDuration);
  }

  intToTime(int value) {
    int m;
    int s;

    m = (value) ~/ 60;

    s = value - (m * 60);

    String minute = m.toString();

    String seconds =
        s.toString().length < 2 ? "0" + s.toString() : s.toString();

    String result = "$minute:$seconds";

    return result;
  }
}
