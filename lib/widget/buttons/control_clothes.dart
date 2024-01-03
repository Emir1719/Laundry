import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/user.dart';
import 'package:laundry/service/database_repository.dart';
import 'package:laundry/view/machine_control.dart';

class BtnControlClothes extends StatelessWidget {
  const BtnControlClothes({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = locator<DatabaseRepository>();

    return FutureBuilder<AppUser?>(
      future: repository.currentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Hata: ${snapshot.error}');
        } else {
          AppUser? user = snapshot.data;
          return user!.isAdmin == true
              ? Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.to(() => const MachineControlView());
                        },
                        label: const Text("Makineleri Kontrol Et"),
                        icon: const Icon(Icons.settings),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        label: const Text("Duyuru Gir"),
                        icon: const Icon(Icons.control_point),
                      ),
                    ),
                  ],
                )
              : const SizedBox();
        }
      },
    );
  }
}
