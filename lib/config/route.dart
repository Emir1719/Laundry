import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/notification.dart';
import 'package:laundry/presentation/controller/user_controller.dart';
import 'package:laundry/presentation/view/add_announcement.dart';
import 'package:laundry/presentation/view/announcement.dart';
import 'package:laundry/presentation/view/form.dart';
import 'package:laundry/presentation/view/home.dart';
import 'package:laundry/presentation/view/login.dart';
import 'package:laundry/presentation/view/machine_control.dart';
import 'package:laundry/presentation/view/qr_scanner.dart';
import 'package:laundry/presentation/view/register.dart';
import 'package:laundry/presentation/view/settings.dart';
import 'package:laundry/presentation/view/splash.dart';

class AppRoute {
  static const register = "/register";
  static const home = "/home";
  static const login = "/login";
  static const announcement = "/announcement";
  static const form = "/form";
  static const machineControl = "/machineControl";
  static const qr = "/qr";
  static const setting = "/setting";
  static const addAnnouncement = "/addAnnouncement";
  static const splash = "/splash";

  static appRoutes() {
    Transition? transition = Transition.native;

    if (TargetPlatform.iOS == defaultTargetPlatform) {
      transition = Transition.cupertino;
    }

    return [
      GetPage(
        name: home,
        page: () => const HomeView(),
        popGesture: false,
        transition: transition,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => UserController());
          Get.lazyPut(() => NotificationController());
        }),
      ),
      GetPage(
        name: login,
        page: () => const LoginView(),
        transition: transition,
      ),
      GetPage(
        name: register,
        page: () => const RegisterView(),
        popGesture: false,
        transition: transition,
      ),
      GetPage(
        name: announcement,
        page: () => const AnnouncementView(),
        transition: transition,
      ),
      GetPage(
        name: form,
        page: () => const FormView(),
        transition: transition,
      ),
      GetPage(
        name: machineControl,
        page: () => const MachineControlView(),
        transition: transition,
      ),
      GetPage(
        name: qr,
        page: () => const QRCodeScannerView(),
        transition: transition,
      ),
      GetPage(
        name: setting,
        page: () => const SettingsView(),
        transition: transition,
      ),
      GetPage(
        name: addAnnouncement,
        page: () => const AddAnnouncementView(),
        transition: transition,
      ),
      GetPage(
        name: splash,
        page: () => const SplashView(),
        transition: transition,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => UserController());
        }),
      ),
    ];
  }
}
