import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/shop_login_screen.dart';
import 'package:shop_app/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class BoardingItemModel {
  final String image;
  final String title;
  final String body;

  BoardingItemModel({
    required this.image,
    required this.title,
    required this.body,
  });
}
class OnboardingScreen extends StatefulWidget {

  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var boardingController = PageController();

  List<BoardingItemModel> boardingItems = [
    BoardingItemModel(
      image: 'assets/images/onboard_1.jpg',
      title: 'Onboarding 1 Title',
      body: 'Onboarding 1 Body',
    ),
    BoardingItemModel(
      image: 'assets/images/onboard_1.jpg',
      title: 'Onboarding 2 Title',
      body: 'Onboarding 2 Body',
    ),
    BoardingItemModel(
      image: 'assets/images/onboard_1.jpg',
      title: 'Onboarding 3 Title',
      body: 'Onboarding 3 Body',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        //title: Text('OnboardingScreen'),
        //centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // navigate to home
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>  ShopLoginScreen(),
                ),
              );
            },
            child:  Text(
              'SKIP',
              style: TextStyle(
                color: MyColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardingController,
                onPageChanged: (index) {
                  if (index == boardingItems.length - 1) {
                    // last page
                  }
                },
                //physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildOnboardingItem(context,boardingItems[index]),
                itemCount: boardingItems.length,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardingController,
                    count: boardingItems.length,
                    effect:  ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: MyColors.primaryColor,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 5.0,
                      expansionFactor: 4,
                    )

                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: MyColors.primaryColor,
                  onPressed: () {
                    if (boardingController.page == boardingItems.length - 1) {
                      // navigate to home
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                             builder: (context) =>  ShopLoginScreen(),
                      )
                      );
                    } else {
                      boardingController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column buildOnboardingItem(BuildContext context,BoardingItemModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image.asset(model.image)),
        const SizedBox(height: 20),
        Text(
          model.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20.0),
         Text(
          model.body,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
