import 'package:animated_introduction/animated_introduction.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/screens/home.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  static String id = "/into";

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  late AudioPlayer player = AudioPlayer();
  PlayerState? _playerState;
  bool get _isPlaying => _playerState == PlayerState.playing;
  bool isPlaying = false;

  Future<void> _play() async {
    await player.resume();
    setState(() => _playerState = PlayerState.playing);
  }

  Future<void> _stop() async {
    await player.stop();
    setState(() {
      _playerState = PlayerState.stopped;
    });
  }

  void _initStreams() {
    Future<void> _pause() async {
      await player.pause();
      setState(() => _playerState = PlayerState.paused);
    }
  }

  @override
  void initState() {
    player.setReleaseMode(ReleaseMode.stop);
    _playerState = player.state;
    player.getDuration().then(
          (value) => setState(() {}),
        );
    player.getCurrentPosition().then(
          (value) => setState(() {}),
        );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player.setSource(AssetSource('audios/001.mp3'));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedIntroduction(
        doneText: "البداء",
        nextText: 'التالي',
        skipText: "",
        slides: [
          SingleIntroScreen(
            title: "مرحبا بك ",
            description: "لنبداء التعلم",
            headerWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/basmala.png"),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ ﴿2﴾ الرَّحْمَٰنِ الرَّحِيمِ ﴿3﴾ مَالِكِ يَوْمِ الدِّينِ ﴿4﴾ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ ﴿5﴾ اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ ﴿6﴾ صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ ﴿7﴾ح',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                      if (isPlaying) {
                        _play();
                      } else {
                        _stop();
                      }
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        child: Icon(
                          isPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleIntroScreen(
             title: "مرحبا بك ",
            description: "لنبداء التعلم",
            headerWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset("assets/images/basmala.png"),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child:  const Text('العلم نور',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ],
            ),
          ),
        ],
        onDone: () => Get.offAllNamed(Home.id),
      ),
    );
  }
}
