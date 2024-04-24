import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final RxInt currentPage = 0.obs;

  void goPage(int page, PageController pageController) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  void animatePage(int page, PageController pageController) {
    currentPage.value = page;
    pageController.animateToPage(
      page,
      duration: Duration(
        milliseconds: 500,
      ),
      curve: Curves.ease,
    );
  }
}
