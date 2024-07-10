import 'package:flutter/material.dart';
import 'package:laundry/presentation/widget/buttons/goto_settings.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Ana Sayfa"),
      actions: const [BtnGotoSettings()],
      automaticallyImplyLeading: false,
    );
  }
}
