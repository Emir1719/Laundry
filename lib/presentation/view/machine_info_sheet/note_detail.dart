import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/presentation/controller/machine_controller.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/domain/model/note.dart';

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

            return Column(
              children: [
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                  },
                  border: TableBorder.all(
                    color: Colors.grey,
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    _createTableRow("File No", note.fileNo),
                    _createTableRow("Derece", "${note.degree} °C"),
                    _createTableRow("Yıkama Modu", note.mode),
                    _createTableRow("Kurutma Modu", note.modeDry),
                    _createTableRow("Not", note.comment),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  TableRow _createTableRow(String title, String value) {
    final style = locator<AppStyle>();
    const padding = EdgeInsets.symmetric(vertical: 5, horizontal: 15);

    return TableRow(
      children: [
        Padding(
          padding: padding,
          child: Text(title, style: style.machineSettingOption),
        ),
        Padding(
          padding: padding,
          child: Text(value, style: style.machineSetting),
        ),
      ],
    );
  }
}
