import 'package:flutter/material.dart';
import 'package:laundry/constant/image.dart';
import 'package:laundry/widget/buttons/control_clothes.dart';
import 'package:laundry/widget/buttons/goto_settings.dart';
import 'package:laundry/widget/buttons/scan_qr.dart';
import 'package:laundry/widget/machine_count_text.dart';
import 'package:laundry/widget/short_announcement.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final image = AppImage.getInstance();
    const space = SizedBox(height: 20);

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ana Sayfa"),
          actions: const [BtnGotoSettings()],
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: const [
              //image.washing,
              ShortAnnouncement(),
              MachineCountText(),
              BtnScanQR(),
              space,
              BtnControlClothes(),
            ],
          ),
        ),
      ),
    );
  }
}
