import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/config/route.dart';
import 'package:laundry/presentation/controller/signout_controller.dart';
import 'package:laundry/presentation/controller/user_controller.dart';
import 'package:laundry/util/constant/app_message.dart';
import 'package:laundry/util/constant/style.dart';

class SettingsView extends GetView<SignOutController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 20);
    final user = UserController.call.user;

    return Scaffold(
      appBar: AppBar(title: const Text("Ayarlar")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _listTile(
              onTap: () {
                if (user?.id == "CS7oa3eEd2g6KMVhsP9mX8l7eY42" || user?.email == "admin@gmail.com") {
                  AppMessage.show(title: "Görevli İsim Değiştiremez", message: "Hata", type: Type.error);
                  return;
                }
                Get.toNamed(AppRoute.changeName);
              },
              title: "İsim Güncelleme",
              color: Colors.grey.shade900,
              icon: Icons.person,
            ),
            space,
            _listTile(
              onTap: controller.onTab,
              title: "Çıkış Yap",
              color: Colors.red.shade900,
              icon: Icons.exit_to_app,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _listTile({
    required void Function()? onTap,
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: AppStyle().announcementContainer(),
        child: ListTile(
          leading: Icon(icon, color: color),
          title: Text(title.trim()),
        ),
      ),
    );
  }
}
