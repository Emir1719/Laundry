import 'package:flutter/material.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/service/database_repository.dart';

class BtnDeleteAnnouncement extends StatelessWidget {
  const BtnDeleteAnnouncement({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: locator<DatabaseRepository>().currentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data!.isAdmin) {
          return TextButton.icon(onPressed: () {}, icon: const Icon(Icons.delete), label: const Text("Sil"));
        }
        return const SizedBox();
      },
    );
  }
}
