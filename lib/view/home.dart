import 'package:flutter/material.dart';
import 'package:laundry/constant/image.dart';
import 'package:laundry/widget/buttons/control_clothes.dart';
import 'package:laundry/widget/buttons/put_clothes.dart';
import 'package:laundry/widget/machine_count_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final image = AppImage.getInstance();
    const space = 20.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            image.washing,
            const MachineCountText(),
            const BtnPutClothes(),
            const SizedBox(height: space),
            const BtnControlClothes(),
          ],
        ),
      ),
    );
  }
}
