import 'package:flutter/material.dart';
import 'package:laundry/util/constant/image.dart';

class KoskLogo extends StatelessWidget {
  const KoskLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Image.asset(AppImage.logo, height: 180),
    );
  }
}
