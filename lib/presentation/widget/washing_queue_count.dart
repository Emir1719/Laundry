import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/presentation/controller/machine_controller.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/domain/repository/database_repository.dart';

class WashingQueueCount extends StatelessWidget {
  const WashingQueueCount({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = locator<DatabaseRepository>();
    final style = locator<AppStyle>();

    return GetBuilder<MachineController>(
      builder: (controller) {
        return StreamBuilder(
          stream: repo.getAllUserFromQueueStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return CircleAvatar(
              backgroundColor: Colors.deepOrange,
              child: Text(
                snapshot.data!.docs.length.toString(),
                style: style.queueCount,
              ),
            );
          },
        );
      },
    );
  }
}
