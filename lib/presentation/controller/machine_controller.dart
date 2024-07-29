import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/util/constant/app_message.dart';
import 'package:laundry/util/constant/enums/machine_enum.dart';
import 'package:laundry/util/device.dart';
import 'package:laundry/presentation/controller/notification.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/domain/model/machine.dart';
import 'package:laundry/domain/model/note.dart';
import 'package:laundry/domain/model/user.dart';
import 'package:laundry/domain/repository/database_repository.dart';
import 'package:laundry/presentation/view/machine_info_sheet/machine_setting.dart';
import 'package:laundry/presentation/view/users_at_queue.dart';
import 'package:laundry/presentation/widget/loading_bar.dart';

class MachineController extends GetxController {
  var machines = <Machine>[].obs;
  var users = <AppUser?>[].obs;
  final repository = locator<DatabaseRepository>();
  var subtitle = <String>[].obs;
  AppUser? currentUser, tempUser;
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
    users.assignAll(userList); // Listeyi atama
    return userList;
  }

  /// Makineye tıklandığında ayarlar ve notları çıkartır.
  void onTab(int i) {
    _setCurrentValue(i);
    bool isPortrait = AppDevice.isPortrait;

    showModalBottomSheet(
      context: Get.context!,
      useSafeArea: true,
      builder: (context) => const SingleChildScrollView(child: MachineSetting()),
      constraints: BoxConstraints(
        maxHeight: isPortrait ? AppDevice.height * 0.8 : AppDevice.height,
        maxWidth: isPortrait ? AppDevice.width : AppDevice.width,
      ),
      isScrollControlled: !isPortrait, // Yatay modda tam ekran olsun
    );
  }

  /// Yıkama sırasındaki kişilerin adını listeler.
  void onTabShowQueue() {
    bool isPortrait = AppDevice.isPortrait;

    showModalBottomSheet(
      context: Get.context!,
      useSafeArea: true,
      builder: (context) => const UsersAtQueue(),
      constraints: BoxConstraints(
        maxHeight: isPortrait ? AppDevice.height * 0.8 : AppDevice.height,
        maxWidth: isPortrait ? AppDevice.width : AppDevice.width,
      ),
      isScrollControlled: !isPortrait,
    );
  }

  /// Veri tabanına yeni makine ekler.
  void addMachine() async {
    bool isConntection = await AppDevice.hasNetwork();

    // Bağlantı yoksa makine eklemesin.
    if (!isConntection) {
      AppMessage.show(
        title: "Bağlantı Hatası",
        message: "Lütfen internet bağlantısını kontrol edin",
        type: Type.error,
      );
      return;
    }

    machines.add(await repository.addMachine());
    update();
  }

  /// Aktif makineyi siler.
  void deleteMachine() async {
    String id = currentMachine!.id;
    if (currentUser != null) {
      AppMessage.show(
        title: "Makine Dolu!",
        message: "Makine doluyken silinemez",
        type: Type.error,
      );
      return;
    }
    // Listeden siler
    machines.remove(currentMachine);
    // Veri tabanından siler
    await repository.deleteMachine(id);
    Navigator.pop(Get.context!);
    update();
  }

  /// Icon butona kullanıcı eklemek için tıklandığında
  void onTabIconBtnAdd(int i) async {
    try {
      _setCurrentValue(i);
      if (tempUser != null) {
        await repository.updateMachineUserId(currentMachine!.id, tempUser!.id);
        tempUser = null;
        update();
        return;
      }
      LoadingBar.open();
      users[i] = await repository.getUserFromQueue();
      _setCurrentValue(i);
      if (currentUser == null) {
        AppMessage.show(
          title: "Sırada kimse yok",
          message: "Sıra boş olduğu için ekleme yapılamaz.",
          type: Type.warning,
        );
        LoadingBar.close();
        return;
      }
      // Makineye kullanıcıyı ekler.
      await repository.updateMachineUserId(currentMachine!.id, currentUser!.id);
      iconBtnStates[i] = false; // Butonu - yapmak için
      update();
      LoadingBar.close();

      _sendNotification(
        title: "Kıyafetleriniz ${i + 1}. Makineye Koyuldu",
        subtitle: "İşleminiz bitince sizi bilgilendireceğiz",
      );
    } catch (e) {
      AppMessage.show(title: "Bilinmeyen bir hata oluştu", message: e.toString(), type: Type.warning);
    }
  }

  /// Icon butona kullanıcı silmek için tıklandığında
  void onTabIconBtnRemove(int i) async {
    try {
      /// Aktif kullanıcı belirlenir ve hem ui'dan hem de veri tabanından silinir.
      _setCurrentValue(i);
      LoadingBar.open();
      deleteUserFromMachine(); // vt için
      iconBtnStates[i] = true; // ui için
      LoadingBar.close();

      /// Eğer makinenin türü yıkamaysa bildirim gönderme.
      if (currentMachine!.type == MachineType.wash) {
        return;
      }

      _sendNotification(
        title: "Kıyafetleriniz Hazır",
        subtitle: "Lütfen çamaşırhaneye gelip kıyafetlerinizi alınız",
      );
    } catch (e) {
      AppMessage.show(title: "Bilinmeyen bir hata oluştu", message: e.toString(), type: Type.warning);
    }
  }

  void _sendNotification({required String title, required String subtitle}) async {
    /// Eğer aktif kullanıcı boşsa bildirim gönderme.
    if (currentUser == null) {
      return;
    }

    /// Şu anki aktif kullanıcının token değerini alır.
    /// Boş değilse bildirim gönderir.
    String? token = await repository.getToken(currentUser!.id);
    if (token != null || token!.isNotEmpty) {
      final noti = Get.put(NotificationController());
      noti.sendNotification(token: token, title: title, body: subtitle);
    }
  }

  /// Aktif kullanıcıyı makineden çıkartır ve veri tabanında da bunu günceller.
  void deleteUserFromMachine() async {
    // Yıkama türündeki makineden çıkan kişinin kıyafetleri hazır olmayacak
    // Diğer türlerden çıkarıldığında kişinin tempde bilgisi tutulmaz.
    if (currentMachine!.type == MachineType.wash) {
      tempUser = currentUser;
    }

    bool result = await repository.updateMachineUserId(currentMachine!.id, "");
    if (result) {
      users.remove(currentUser);
      currentUser = null;
      update();
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
    // makineyi aktif mi servis dışı mı belirlenir.
    await repository.updateMachineActive(currentMachine!.id, result ?? true);
    currentMachine!.isActive = result!;
    if (result == false) {
      // Eğer makine servis dışı olursa içindeki kullanıcıyı sil.
      deleteUserFromMachine();
    } else {
      update();
    }

    if (Get.context != null) {
      Navigator.pop(Get.context!);
    }

    LoadingBar.close();
  }

  /// Makinenin türünü belirler.
  void setType(String? value) async {
    LoadingBar.open();
    var result = await repository.updateMachineType(currentMachine!.id, value ?? MachineType.wash.value);
    if (result) {
      currentMachine!.type = MachineType.getTypeFromString(value!);
      if (Navigator.canPop(Get.context!)) {
        Navigator.pop(Get.context!);
      }
      update();
    }
    LoadingBar.close();
  }

  /// Makinenin altına kişinin adını yazar.
  /// Duruma göre Boş ya da Servis dışı da yazabilir.
  String getSubtitle(int i) {
    if (machines[i].isActive) {
      return users[i]?.name ?? "Boş";
    } else {
      return "Servis Dışı";
    }
  }

  /// Aktif kullanıcı ve makineyi belirler.
  void _setCurrentValue(int i) {
    currentUser = users[i];
    currentMachine = machines[i];
  }

  String getType(int i) {
    _setCurrentValue(i);
    return currentMachine!.type.value;
  }
}
