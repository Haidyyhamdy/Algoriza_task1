import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/loginScreen.dart';
import 'package:shop_app/modules/register/register_screen.dart';
import 'package:shop_app/components/components.dart';
import 'package:shop_app/components/default_text_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/default_button.dart';

class PagesModel {
  final String image;
  final String title;
  final String body;
  PagesModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  var pageController = PageController();
  List onBoardingPages = [
    PagesModel(
        image: 'assets/images/orderFood.png',
        title: 'Order Your Favourites',
        body:
            'When Your order Eat Street, we will hook\n '
                '      you up with exclusive coupons,\n'
            '            special sand rewards. '),
    PagesModel(
        image: 'assets/images/takeAway.png',
        title: '30 Minute Delivery',
        body: 'we have young and professional delivery \n'
            'team that will bring your food as soon as\n'
            '         possible to your doorstep'),
    PagesModel(
        image: 'assets/images/mobilePayments.png',
        title: 'Easy Payment',
        body: '    We make food ordering fast, \n'
            'simple and free - no matter if you \n'
            '         order online or cash '),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: DefaultTextButton(
              text: 'Skip',
              textColor: Colors.black,
              radius: 20,
              background: Color.fromRGBO(253, 249, 236, 1),
              onClick: () {
                navigateAndReplace(context, LoginScreen());
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
         RichText(
             text: TextSpan(children: [
               TextSpan(
                text: 'Food',
                 style: TextStyle(
                   fontSize: 28,
                   color: Colors.deepOrange,
                   fontFamily: 'Cardo',
                   fontStyle: FontStyle.italic,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               TextSpan(
                 text: 'App',
                 style: TextStyle(
                   fontSize: 22,
                   color: Colors.black,
                   fontFamily: 'Cardo',
                   fontWeight: FontWeight.bold,
                   fontStyle: FontStyle.italic,
                 ),
               ),
             ])),
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              itemBuilder: (context, index) =>
                  buildOnBoardingItem(onBoardingPages[index]),
              itemCount: onBoardingPages.length,
              onPageChanged: (int index) {
                if (index == onBoardingPages.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: onBoardingPages.length,
            effect: const JumpingDotEffect(
                activeDotColor: Colors.deepOrange,
                dotColor: Colors.grey,
                dotWidth: 25.0,
                dotHeight: 8.0,
                spacing: 5.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DefaultButton(
              onClick: () {
                if(isLast){
                  navigateAndReplace(context, LoginScreen());
                }else{
                  pageController.nextPage(curve: Curves.fastLinearToSlowEaseIn,
                  duration: Duration(milliseconds: 500));
                }

              },
              text: isLast ? 'Get Started' : 'Next',
              background: Colors.deepOrange,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account?'),
              DefaultTextButton(
                text: 'Sign Up',
                textColor: Colors.deepOrange,
                background: Colors.white,
                onClick: () {
                  navigateAndReplace(context, RegisterScreen());
                },
              ),

            ],
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }

  Widget buildOnBoardingItem(PagesModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
            fit: BoxFit.fitWidth,
          ),
        ),
        Text(
          model.title,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          model.body,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
