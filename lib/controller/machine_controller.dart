import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/machine.dart';
import 'package:laundry/model/note.dart';
import 'package:laundry/model/user.dart';
import 'package:laundry/service/database_repository.dart';
import 'package:laundry/view/machine_setting.dart';

class MachineController extends GetxController {
  var machines = <Machine>[].obs;
  var user = <AppUser?>[].obs;
  final repository = locator<DatabaseRepository>();
  var subtitle = <String>[].obs;
  AppUser? currentUser;
  Machine? currentMachine;

  ///Makineleri kullanan kullanıcıları getirir
  Future<List<AppUser?>> getUsers() async {
    List<AppUser?> userList = [];

    for (var i = 0; i < machines.length; i++) {
      if (machines[i].userId.isNotEmpty) {
        userList.add(await repository.getUser(machines[i].userId));
      } else {
        userList.add(null);
      }
    }

    user.assignAll(userList); // Listeyi atama
    return userList;
  }

  void onTab(int i) {
    currentUser = user[i];
    currentMachine = machines[i];
    showModalBottomSheet(
      context: Get.context!,
      useSafeArea: true,
      builder: (context) => const MachineSetting(),
    );
  }

  void onTabIconBtn(int i) {
    var deneme = AppUser();
    deneme.id = "y0HiQ19bZWPfTWTKmpQop7rsb253";
    deneme.email = "-";
    deneme.name = "Emir";
    deneme.isAdmin = false;
    user[i] = deneme;
  }

  Future<Note?> getNote() async {
    if (currentUser == null) {
      return null;
    }
    print(currentUser!.id);
    return await repository.getNote(currentUser!.id);
  }

  void setActive(bool? result) async {
    await repository.updateMachineActive(currentMachine!.id, result ?? true);
    currentMachine!.isActive = result!;
    update();
  }

  String getSubtitle(int i) {
    if (machines[i].isActive) {
      return user[i]?.name ?? "Boş";
    } else {
      return "Servis Dışı";
    }
  }

  void setSubtitle(int i, String text) {
    subtitle[i] = text;
  }
}
