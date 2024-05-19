// ignore_for_file: unused_import, unused_local_variable, unused_element

import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:untitled2/controllers/main_controller.dart';
import 'package:untitled2/screens/about.dart';
import 'package:untitled2/screens/books.dart';
import 'package:untitled2/screens/classes.dart';
import 'package:untitled2/screens/root.dart';
import 'package:untitled2/widgets/bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  static String id = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final mainController = MainController();
  PageController pageController = PageController(initialPage: 0);

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
    var math;
    return Scaffold(
      appBar: AppBar(
        title: const Text('تعليم الكبار'),
        centerTitle: true,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) =>
            mainController.animatePage(value, pageController),
        children: const [
          Root(),
          Classes(),
          Books(),
          About(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 35,
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomBar(
                pageController: pageController,
                title: "الرئسية",
                icon: Icons.home_rounded,
                pageNumber: 0,
                color: mainController.currentPage.value == 0
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              BottomBar(
                pageController: pageController,
                title: "المراحل",
                icon: Icons.widgets_outlined,
                pageNumber: 1,
                color: mainController.currentPage.value == 1
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              BottomBar(
                pageController: pageController,
                title: "الكتب",
                icon: Icons.library_books_rounded,
                pageNumber: 2,
                color: mainController.currentPage.value == 2
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              BottomBar(
                pageController: pageController,
                title: "عنا",
                icon: Icons.info_outline_rounded,
                pageNumber: 3,
                color: mainController.currentPage.value == 3
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
