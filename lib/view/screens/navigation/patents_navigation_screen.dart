import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helth_care_client/constants/constants.dart';
import 'package:helth_care_client/controllers/auth_controller.dart';
import 'package:helth_care_client/controllers/navigation_controller.dart';
import 'package:helth_care_client/routes/routes.dart';
import 'package:helth_care_client/view/screens/navigation/chat_screen.dart';
import 'package:helth_care_client/view/screens/navigation/home_screen.dart';

class PatentsNavigationScreen extends GetView<NavigationController> {
  const PatentsNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (_) {
        List<String> titles = [
          'نصائح صحية',
          'المحادثات',
        ];
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              titles[controller.selectedIndex],
              style: const TextStyle(
                fontFamily: 'Expo',
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                AuthController().logout();
              },
              child: const Icon(Icons.logout),
            ),
          ),
          body: IndexedStack(
            index: controller.selectedIndex,
            children: const [
              HomeScreen(),
              ChatScreen(),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex,
            onTap: (index) => controller.changeNavigation(index),
            selectedLabelStyle: const TextStyle(fontFamily: 'Expo'),
            unselectedLabelStyle: const TextStyle(fontFamily: 'Expo'),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined),
                activeIcon: Icon(Icons.chat),
                label: 'المحادثات',
              ),
            ],
          ),
        );
      },
    );
  }
}
