import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/config/route.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/domain/model/user.dart';
import 'package:laundry/domain/repository/database_repository.dart';

class BtnControlClothes extends StatelessWidget {
  const BtnControlClothes({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = locator<DatabaseRepository>();
    final style = locator<AppStyle>();

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
              ? TextButton(
                  onPressed: () => Get.toNamed(AppRoute.machineControl),
                  style: style.getMainButtons(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.settings, size: style.mainButtonIconSize),
                      SizedBox(height: style.mainButtonSpaceBetween),
                      const Text("Makine Kontrol", textAlign: TextAlign.center),
                    ],
                  ),
                )
              : const SizedBox();
        }
      },
    );
  }
}
