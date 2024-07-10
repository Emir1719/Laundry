import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/config/route.dart';
import 'package:laundry/presentation/controller/user_controller.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/config/locator.dart';

class BtnEnterAnnoencement extends StatelessWidget {
  const BtnEnterAnnoencement({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();
    final cont = UserController.call;

    if (cont.user == null) {
      return const SizedBox();
    }

    return cont.user!.isAdmin == true
        ? TextButton(
            onPressed: () => Get.toNamed(AppRoute.addAnnouncement),
            style: style.getMainButtons(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.control_point, size: style.mainButtonIconSize),
                SizedBox(height: style.mainButtonSpaceBetween),
                const Text("Duyuru Gir", textAlign: TextAlign.center),
              ],
            ),
          )
        : const SizedBox();
  }
}
