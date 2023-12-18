import 'package:flutter/material.dart';
import 'package:laundry/constant/image.dart';
import 'package:laundry/model/user.dart';
import 'package:laundry/widget/machine_count_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    AppUser user = AppUser();
    final image = AppImage.getInstance();
    user.isAdmin = true;
    const space = 20.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
        actions: user.isAdmin == true ? [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))] : null,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image.washing,
              const SizedBox(height: space),
              const MachineCountText(),
              const SizedBox(height: space),
              ElevatedButton.icon(
                onPressed: () {},
                label: const Text("Çamaşırları Makineye Koydum"),
                icon: const Icon(Icons.wash_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
