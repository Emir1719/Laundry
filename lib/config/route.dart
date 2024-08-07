import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/announcement_controller.dart';
import 'package:laundry/presentation/controller/form_controller.dart';
import 'package:laundry/presentation/controller/machine_controller.dart';
import 'package:laundry/presentation/controller/notification.dart';
import 'package:laundry/presentation/controller/setting.dart';
import 'package:laundry/presentation/controller/signout_controller.dart';
import 'package:laundry/presentation/controller/user_controller.dart';
import 'package:laundry/presentation/controller/video_controller.dart';
import 'package:laundry/presentation/view/add_announcement.dart';
import 'package:laundry/presentation/view/announcement.dart';
import 'package:laundry/presentation/view/change_name.dart';
import 'package:laundry/presentation/view/form.dart';
import 'package:laundry/presentation/view/home.dart';
import 'package:laundry/presentation/view/login.dart';
import 'package:laundry/presentation/view/machine_control.dart';
import 'package:laundry/presentation/view/qr_scanner.dart';
import 'package:laundry/presentation/view/register.dart';
import 'package:laundry/presentation/view/settings.dart';
import 'package:laundry/presentation/view/splash.dart';
import 'package:laundry/presentation/view/video.dart';

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
  static const changeName = "/changeName";
  static const video = "/video";

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
          // Normal kullanıcıdan admine geçince bazı butonlar gözükmüyor.
          // Bu yüzden user'ı tekrar güncelledik
          Get.lazyPut(() => UserController());
          Get.lazyPut(() => NotificationController());
          Get.lazyPut(() => AnnouncementController());
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
        binding: BindingsBuilder(() {
          Get.lazyPut(() => FormController());
        }),
      ),
      GetPage(
        name: machineControl,
        page: () => const MachineControlView(),
        transition: transition,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => MachineController());
        }),
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
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SignOutController());
        }),
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
      GetPage(
        name: changeName,
        page: () => const ChangeNameView(),
        transition: transition,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SettingController());
        }),
      ),
      GetPage(
        name: video,
        page: () => const VideoView(),
        transition: transition,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => VideoController());
        }),
      ),
    ];
  }
}
