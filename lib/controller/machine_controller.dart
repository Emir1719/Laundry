import 'package:get/get.dart';
import 'package:laundry/locator.dart';
import 'package:laundry/model/machine.dart';
import 'package:laundry/model/user.dart';
import 'package:laundry/service/database_repository.dart';

class MachineController extends GetxController {
  var machines = <Machine>[].obs;
  var user = <AppUser?>[].obs;
  final repository = locator<DatabaseRepository>();

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
    if (user[i] != null) {
      print(user[i]!.name);
    }
  }
}
