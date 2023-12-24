import 'package:flutter/material.dart';
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
          return const Center(child: CircularProgressIndicator()); // Eğer kullanıcı yükleniyorsa gösterilecek widget
        } else if (snapshot.hasError) {
          return Text('Hata: ${snapshot.error}');
        } else {
          AppUser? user = snapshot.data;
          return user!.isAdmin == true
              ? ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text("Çamaşırları Kontrol Et"),
                  icon: const Icon(Icons.control_point),
                )
              : const SizedBox();
        }
      },
    );
  }
}
