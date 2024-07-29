import 'package:flutter/material.dart';
import 'package:laundry/presentation/widget/buttons/add_announcement.dart';
import 'package:laundry/presentation/widget/buttons/control_clothes.dart';
import 'package:laundry/presentation/widget/buttons/scan_qr.dart';
import 'package:laundry/presentation/widget/buttons/video.dart';
import 'package:laundry/presentation/widget/machine_count_text.dart';

class HomeBottomSection extends StatelessWidget {
  const HomeBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            BtnVideo(),
          ],
        ),
      ),
    );
  }
}
