import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/notification.dart';
import 'package:laundry/widget/buttons/add_announcement.dart';
import 'package:laundry/widget/buttons/control_clothes.dart';
import 'package:laundry/widget/buttons/goto_settings.dart';
import 'package:laundry/widget/buttons/scan_qr.dart';
import 'package:laundry/widget/machine_count_text.dart';
import 'package:laundry/widget/short_announcement.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    //const space = SizedBox(height: 20);
    Get.put(NotificationController());

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ana Sayfa"),
          actions: const [BtnGotoSettings()],
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            const ShortAnnouncement(),
            Expanded(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  children: const [
                    MachineCountText(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BtnEnterAnnoencement(),
                        BtnScanQR(),
                        BtnControlClothes(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
