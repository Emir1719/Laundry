import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/style.dart';
import 'package:laundry/controller/machine_controller.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/note.dart';

class NotDetail extends StatelessWidget {
  const NotDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MachineController());
    final style = locator<AppStyle>();
    const space = SizedBox(height: 20);

    return Column(
      children: [
        Text("Yıkama Notu", style: style.machineSettingTitle, textAlign: TextAlign.center),
        space,
        FutureBuilder(
          future: controller.getNote(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return const Text("Not yok");
            }
            Note note = snapshot.data!;
            return GetBuilder<MachineController>(builder: (controller) {
              return Column(
                children: [
                  _createRow("File No", note.fileNo),
                  _createRow("Derece", "${note.degree} °C"),
                  _createRow("Yıkama Modu", note.mode),
                  _createRow("Not", note.comment),
                ],
              );
            });
          },
        ),
      ],
    );
  }

  Widget _createRow(String title, String value) {
    final style = locator<AppStyle>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: ", style: style.machineSettingOption),
          Expanded(child: Text(value, style: style.machineSetting, maxLines: 6)),
        ],
      ),
    );
  }
}
