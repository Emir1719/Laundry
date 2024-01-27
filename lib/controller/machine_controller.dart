import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/constant/snackbar_message.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/machine.dart';
import 'package:laundry/model/note.dart';
import 'package:laundry/model/user.dart';
import 'package:laundry/service/database_repository.dart';
import 'package:laundry/view/machine_setting.dart';
import 'package:laundry/view/users_at_queue.dart';
import 'package:laundry/widget/loading_bar.dart';

class MachineController extends GetxController {
  var machines = <Machine>[].obs;
  var user = <AppUser?>[].obs;
  final repository = locator<DatabaseRepository>();
  var subtitle = <String>[].obs;
  AppUser? currentUser;
  Machine? currentMachine;
  var iconBtnStates = <bool>[]; // Icon button için swich yapısı sağlandı

  ///Makineleri kullanan kullanıcıları getirir
  Future<List<AppUser?>> getUsers() async {
    List<AppUser?> userList = [];
    iconBtnStates = [];

    for (var i = 0; i < machines.length; i++) {
      if (machines[i].userId.isNotEmpty) {
        iconBtnStates.add(false);
        userList.add(await repository.getUser(machines[i].userId));
      } else {
        iconBtnStates.add(true);
        userList.add(null);
      }
    }
    user.assignAll(userList); // Listeyi atama
    return userList;
  }

  /// Makineye tıklandığında ayarlar ve notları çıkartır.
  void onTab(int i) {
    currentUser = user[i];
    currentMachine = machines[i];
    showModalBottomSheet(
      context: Get.context!,
      useSafeArea: true,
      builder: (context) => const MachineSetting(),
    );
  }

  void onTabShowQueue() {
    showModalBottomSheet(
      context: Get.context!,
      useSafeArea: true,
      builder: (context) => const UsersAtQueue(),
    );
  }

  /// Icon butona kullanıcı eklemek için tıklandığında
  void onTabIconBtnAdd(int i) async {
    LoadingBar.open();
    AppUser? lastUser = await repository.getUserFromQueue();
    if (lastUser == null) {
      AppMessage.show(title: "Sırada kimse yok", message: "Sıra boş olduğu için ekleme yapılamaz.", type: Type.warning);
      LoadingBar.close();
      return;
    }
    user[i] = lastUser;
    await repository.updateMachineUserId(machines[i].id, lastUser.id);
    iconBtnStates[i] = false;
    update();
    LoadingBar.close();
  }

  /// Icon butona kullanıcı silmek için tıklandığında
  void onTabIconBtnRemove(int i) async {
    LoadingBar.open();
    deleteUserFromMachine(i);
    iconBtnStates[i] = true;
    update();
    LoadingBar.close();
  }

  void deleteUserFromMachine(int i) async {
    bool result = await repository.updateMachineUserId(machines[i].id, "");
    if (result) {
      user[i] = null;
    } else {
      AppMessage.show(title: "Hata! Silinemedi", message: "İnterneti vb. kontrol ediniz.", type: Type.error);
    }
  }

  /// İlgili makinedeki varsa kişinin notlarını getirir.
  Future<Note?> getNote() async {
    if (currentUser == null) {
      return null;
    }
    return await repository.getNote(currentUser!.id);
  }

  /// Makineyi aktif ya da devre dışı bırakmayı ayarlar.
  void setActive(bool? result) async {
    LoadingBar.open();
    await repository.updateMachineActive(currentMachine!.id, result ?? true);
    currentMachine!.isActive = result!;
    if (result == false) {
      // Hangi i değerine sahip makineyi tespit edip kullanıcıyı siler.
      for (var i = 0; i < user.length; i++) {
        if (currentUser == user[i]) {
          deleteUserFromMachine(i);
        }
      }
    }
    update();
    LoadingBar.close();
  }

  /// Makinenin altına kişinin adını yazar.
  /// Duruma göre Boş ya da Servis dışı da yazabilir.
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
