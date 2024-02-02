import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/route.dart';
import 'package:laundry/controller/notification.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/user.dart';
import 'package:laundry/service/database_repository.dart';

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
                        onPressed: () => Get.toNamed(AppRoute.machineControl),
                        label: const Text("Makineleri Kontrol Et"),
                        icon: const Icon(Icons.settings),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => Get.toNamed(AppRoute.addAnnouncement),
                        label: const Text("Duyuru Gir"),
                        icon: const Icon(Icons.control_point),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        final controller = Get.put(NotificationController());
                        //cargCn6WSkSynkU2gkbQ3r:APA91bHav4iaOSJhOsYQ1yw8Akp_vDZBmPj9kxiHjWULZpgJt7zEjCj1Ylxij0xmHNI-0uT89jhZluMLqF-I9q8HL1RgghwSjV0YlqwifYxQA1a2cMY0BsxAhkotnAmMpn1UP_TcEVVt

                        controller.sendNotification(
                          token:
                              "e7s3AzSLQMGirkrMW2zPpE:APA91bFwiIG7irmWxEpWZh-d18utBAX9ZJ1NgEv9y5ttvQ0Np4g4KSgj2IOR-tLjW8bUAd25SwHooCQZCATstqBQbYqsYgWZa07ypzKULjww6w_5OMViK7u9NjhoP28xIKXnPI6R9Bcy",
                          title: "Kıyafetleriniz Yıkandı",
                          body: "Lütfen çamaşırhaneye gelip kıyafetlerinizi alınız",
                        );
                      },
                      label: const Text("Bildirim Gönder"),
                      icon: const Icon(Icons.send),
                    ),
                  ],
                )
              : const SizedBox();
        }
      },
    );
  }
}
