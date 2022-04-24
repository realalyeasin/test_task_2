import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task_2/Module-Home/Controllers/home_controller.dart';

import '../../Module-Product/Views/offers.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SizedBox.expand(
        child: PageView(
          allowImplicitScrolling: true,
          padEnds: true,
          physics: const ScrollPhysics(
            parent: NeverScrollableScrollPhysics(),
          ),
          children:  [
            const Center(
              child: Text("Home"),
            ),
            Offers(),
            const Center(
              child: Text("Loyalty Card"),
            ),
            const Center(
              child: Text("Account"),
            ),
          ],
          controller: controller.pageController,
        ),
      ),
      bottomNavigationBar: Obx(() => FancyBottomNavigation(
        barBackgroundColor: Colors.black,
        activeIconColor: Colors.white,
        textColor: Colors.white,
        circleColor: Colors.black,
        tabs: [
          TabData(
            iconData: Icons.home_outlined, title: "Home",),
          TabData(iconData: Icons.local_offer_outlined, title: "Offers"),
          TabData(iconData: Icons.card_giftcard_rounded, title: "Layalty Card"),
          TabData(iconData: Icons.account_box_outlined, title: "Account"),
        ],
        onTabChangedListener: (position) {
          controller.currentIndex.value = position;
          controller.pageController.jumpToPage(position);
        },
        initialSelection: controller.currentIndex.value,
        key: controller.bottomNavigationKey,
        inactiveIconColor: Colors.grey,
      )),
    );
  }
}