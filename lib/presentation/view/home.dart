import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/notification.dart';
import 'package:laundry/presentation/controller/user_controller.dart';
import 'package:laundry/presentation/widget/home/bottom_section.dart';
import 'package:laundry/presentation/widget/home/home_appbar.dart';
import 'package:laundry/presentation/widget/short_announcement.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<NotificationController>();
    Get.put(UserController());

    return const PopScope(
      canPop: false,
      child: Scaffold(
        appBar: HomeAppBar(),
        body: Column(
          children: [
            ShortAnnouncement(),
            HomeBottomSection(),
          ],
        ),
      ),
    );
  }
}
