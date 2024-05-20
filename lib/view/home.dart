import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/notification.dart';
import 'package:laundry/widget/home/bottom_section.dart';
import 'package:laundry/widget/home/home_appbar.dart';
import 'package:laundry/widget/short_announcement.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());

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
