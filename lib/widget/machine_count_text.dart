import 'package:flutter/material.dart';
import 'package:laundry/constant/style.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/machine.dart';
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
        stream: repository.getMachinesSnapshot(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Hata: ${snapshot.error}');
          } else {
            var count = 0, activeMachineCount = 0;

            // Veri başarıyla yüklendiğinde
            List<Machine> machineList = [];
            for (var doc in snapshot.data!.docs) {
              machineList.add(Machine.fromMap(doc.data()));
            }

            for (var element in machineList) {
              // Makineyi kullanan kaç kişi varsa belirlenir.
              if (element.userId.isNotEmpty) {
                count++;
              }

              // Kaç tane aktif makine varsa belirlenir.
              if (element.isActive) {
                activeMachineCount++;
              }
            }
            return Text(
              "Makinelerin Doluluk Oranı\n$count / $activeMachineCount",
              style: style.countText,
              textAlign: TextAlign.center,
            );
          }
        },
      ),
    );
  }
}
