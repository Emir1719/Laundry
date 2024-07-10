import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/machine_controller.dart';

class BtnMachineSetting extends StatelessWidget {
  const BtnMachineSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MachineController>(
      builder: (controllerr) {
        return DropdownButton<bool>(
          value: controllerr.currentMachine!.isActive,
          onChanged: controllerr.setActive,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          underline: const SizedBox(),
          items: const [
            DropdownMenuItem<bool>(value: true, child: Text('Aktif')),
            DropdownMenuItem<bool>(value: false, child: Text('Servis Dışı')),
          ],
        );
      },
    );
  }
}
