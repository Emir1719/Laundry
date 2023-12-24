import 'package:flutter/material.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/user.dart';
import 'package:laundry/service/firebase_auth_service.dart';

class BtnControlClothes extends StatelessWidget {
  const BtnControlClothes({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = locator<FirebaseAuthService>();

    return FutureBuilder<AppUser?>(
      future: auth.currentUser(),
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
