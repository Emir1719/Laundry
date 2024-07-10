import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/util/constant/enums/machine_enum.dart';
import 'package:laundry/presentation/controller/machine_controller.dart';

class BtnMachineSettingType extends StatelessWidget {
  const BtnMachineSettingType({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MachineController>(
      builder: (controllerr) {
        return DropdownButton<String>(
          value: controllerr.currentMachine!.type.value,
          onChanged: controllerr.setType,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          underline: const SizedBox(),
          items: [
            DropdownMenuItem<String>(value: MachineType.wash.value, child: Text(MachineType.wash.value)),
            DropdownMenuItem<String>(value: MachineType.dry.value, child: Text(MachineType.dry.value)),
            DropdownMenuItem<String>(value: MachineType.both.value, child: Text(MachineType.both.value)),
          ],
        );
      },
    );
  }
}
