// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_mood/controllers/onboarding_controller.dart';

// ignore: use_key_in_widget_constructors
class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _controller.onboardingPages[index].imageAsset,
                        height: size.height * 0.5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        _controller.onboardingPages[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                            _controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ));
                }),
            Positioned(
                bottom: size.height * 0.1,
                left: size.width * 0.5 - 23,
                child: Row(
                  children: List.generate(
                    _controller.onboardingPages.length,
                    (index) => Obx(() {
                      return Container(
                        margin: EdgeInsets.all(4),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: _controller.selectedPageIndex.value == index
                              ? Colors.black
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      );
                    }),
                  ),
                )),
            Positioned(
                bottom: 10,
                left: size.width * 0.1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        fixedSize: Size(size.width * 0.8, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Obx(() {
                      return Text(_controller.isLastPage ? "Start" : "Next",
                          style: TextStyle(color: Colors.white, fontSize: 18));
                    }),
                    onPressed: _controller.forwardAction)),
          ],
        ),
      ),
    );
  }
}
