import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';
import '../sign_up/signup_screen.dart';

class SplashModel {
  final String image;
  final String description;
  final String title;
  final String title2;
  final String button;

  SplashModel(
      {required this.image,
      required this.description,
      required this.title,
      required this.title2,
      required this.button});
}

class SplashScreen extends StatefulWidget {
  static const String routeName = '/SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ValueNotifier<int> valueNotifier = ValueNotifier(0);
  PageController pageController = PageController();
  List<SplashModel> onBoardingData = [
    SplashModel(
        image: AppAssets.splashImage1,
        description:
            "An elegant invitation is a great way to set the tone for a memorable event. Choosing between premium or free invitations is a personal choice",
        title: "1000's of",
        title2: 'Planner Options',
        button: 'Next'),
    SplashModel(
        image: AppAssets.splashImage2,
        description:
            "Inviting guests for any event can be an exciting yet stressful experience. That's why it's important to make sure you set the tone from your very first invite.",
        title: "Text & Email",
        title2: 'Notification',
        button: 'Next'),
    SplashModel(
        image: AppAssets.splashImage3,
        description:
            "Keeping track of who is attending your events and making sure all the invitations are out for other peoples' events can be a headache.",
        title: "hassle free",
        title2: 'RSVP experience',
        button: 'Get Started')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: ValueListenableBuilder(
                valueListenable: valueNotifier,
                builder: (BuildContext context, int value, Widget? child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: onBoardingData.asMap().entries.map((entry) {
                      return Container(
                        width: 120,
                        height: 7,
                        decoration: BoxDecoration(
                            color: AppColor.kTextColor
                                .withOpacity(value == entry.key ? 0.9 : 0.2)),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            PageView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: onBoardingData.length,
              controller: pageController,
              onPageChanged: (index) {
                valueNotifier.value = index;
              },
              itemBuilder: (BuildContext context, int index) {
                final e = onBoardingData[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),
                    Center(
                      child: Text(
                        e.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        e.title2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        e.image,
                        height: 300,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              e.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              if (pageController.page == 2) {
                                Get.offAllNamed(SignUpScreen.routeName);
                              } else {
                                pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              }
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.kTextColor,
                              ),
                              child: Center(
                                child: Text(
                                  e.button,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
