import 'package:flutter/material.dart';
import 'package:food_mood/models/onbaording_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;

  forwardAction() {
    if (isLastPage) {
      //go to home page
    }
    //
    else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
      'assets/think.png',
      'Wanna cook something new today?',
      'No worries. We got you covered.',
    ),
    OnboardingInfo(
      'assets/cook.png',
      'Short of time?',
      'No issues, we have some quick video recipes for you.',
    ),
    OnboardingInfo(
      'assets/recipe1.png',
      'Recipes at your fingertips',
      'Awesome recipes that you are waiting for!',
    ),
  ];
}
