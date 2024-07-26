import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/config/route.dart';
import 'package:laundry/presentation/controller/user_controller.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/config/locator.dart';

class BtnControlClothes extends StatelessWidget {
  const BtnControlClothes({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();
    final cont = UserController.call;

    if (cont.user == null) {
      return const SizedBox();
    }

    return cont.user!.isAdmin == true
        ? TextButton(
            onPressed: () => Get.toNamed(AppRoute.machineControl),
            style: style.getMainButtons(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_laundry_service_outlined, size: style.mainButtonIconSize),
                SizedBox(height: style.mainButtonSpaceBetween),
                const Text("Makine Kontrol", textAlign: TextAlign.center),
              ],
            ),
          )
        : const SizedBox();
  }
}
