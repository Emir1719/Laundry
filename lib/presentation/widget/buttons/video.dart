import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/config/route.dart';
import 'package:laundry/presentation/controller/user_controller.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/config/locator.dart';

class BtnVideo extends StatelessWidget {
  const BtnVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();
    final cont = UserController.call;

    if (cont.user == null) {
      return const SizedBox();
    }

    return cont.user!.isAdmin
        ? TextButton(
            onPressed: () => Get.toNamed(AppRoute.video),
            style: style.getMainButtons(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.video_collection_outlined, size: style.mainButtonIconSize),
                SizedBox(height: style.mainButtonSpaceBetween),
                const Text("Videolar", textAlign: TextAlign.center),
              ],
            ),
          )
        : const SizedBox();
  }
}
