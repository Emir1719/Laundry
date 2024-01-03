import 'package:flutter/material.dart';
import 'package:laundry/constant/style.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/service/database_repository.dart';

class MachineCountText extends StatelessWidget {
  const MachineCountText({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();
    final repository = locator<DatabaseRepository>();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: StreamBuilder(
        stream: repository.getMachines().asStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Hata: ${snapshot.error}');
          } else {
            var count = 0;
            for (var element in snapshot.data!) {
              if (element.userId.isNotEmpty) {
                count++;
              }
            }
            return Text(
              "Makinelerin Doluluk Oranı\n($count / ${snapshot.data!.length})",
              style: style.countText,
              textAlign: TextAlign.center,
            );
          }
        },
      ),
    );
  }
}
