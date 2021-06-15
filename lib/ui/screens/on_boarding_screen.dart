import 'dart:ui';
import 'package:dexito/ui/screens/home_screen.dart';
import 'package:dexito/ui/utilities/images.dart';
import 'package:dexito/ui/utilities/size_configration.dart';
import 'package:dexito/ui/utilities/strings.dart';
import 'package:dexito/ui/utilities/styles.dart';
import 'package:dexito/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin:
          EdgeInsets.symmetric(horizontal: .2 * SizeConfig.heightMultiplier),
      height: 1.2 * SizeConfig.heightMultiplier,
      width: 1.2 * SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
        color: isActive ? MyColors.appColor : MyColors.appColor.withOpacity(.4),
        borderRadius:
            BorderRadius.all(Radius.circular(10 * SizeConfig.heightMultiplier)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 63 * SizeConfig.heightMultiplier,
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[
                OnboadingPages(
                  img: Images.onBoarding1,
                  heading: "Learn English from Professional",
                  subHeading1: "Get in touch with professional in",
                  subHeading2: "english and improve your skills",
                ),
                OnboadingPages(
                  img: Images.onBoarding2,
                  heading: "Become a English Trainer",
                  subHeading1: "Teach your professional english",
                  subHeading2: "skill to other and mentor them",
                ),
                OnboadingPages(
                  img: Images.onBoarding3,
                  heading: "Learn English the Right way",
                  subHeading1: "English from regional English experts",
                  subHeading2: "and international English trainers",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1 * SizeConfig.heightMultiplier,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
          SizedBox(
            height: 10 * SizeConfig.heightMultiplier,
          ),
          Column(
            children: [
              _currentPage != _numPages - 1
                  ? MyButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      txt: 'Next',
                    )
                  : MyButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      txt: 'Next',
                    ),
              SizedBox(
                height: 1 * SizeConfig.heightMultiplier,
              ),
              MyButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                txt: 'Skip',
                color: Colors.black,
                bColor: Colors.transparent,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget OnboadingPages({
    required String img,
    required String heading,
    required String subHeading1,
    required String subHeading2,
  }) {
    return Column(
      children: [
        Container(
          height: 48 * SizeConfig.heightMultiplier,
          width: double.infinity,
          color: Colors.red,
          child: Image.asset(
            img,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 3 * SizeConfig.heightMultiplier,
        ),
        Container(
          child: Text(
            heading,
            style: TextStyle(
              fontSize: 3.1 * SizeConfig.heightMultiplier,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 1.7 * SizeConfig.heightMultiplier,
        ),
        Container(
          child: Text(
            subHeading1,
            style: TextStyle(
              fontSize: 2.2 * SizeConfig.heightMultiplier,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(.5),
            ),
          ),
        ),
        SizedBox(
          height: .5 * SizeConfig.heightMultiplier,
        ),
        Container(
          child: Text(
            subHeading2,
            style: TextStyle(
              fontSize: 2.2 * SizeConfig.heightMultiplier,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(.5),
            ),
          ),
        ),
      ],
    );
  }
}
