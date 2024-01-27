import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/controller/form_controller.dart';
import 'package:laundry/widget/text_form_fields/text_comment.dart';
import 'package:laundry/widget/text_form_fields/text_degree.dart';
import 'package:laundry/widget/text_form_fields/text_file_no.dart';
import 'package:laundry/widget/text_form_fields/text_wash_mod.dart';

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 20);
    final controller = Get.put(FormController());

    return Scaffold(
      appBar: AppBar(title: const Text("Yıkama Bilgileri")),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFileNo(controller: controller.fileNo, onChanged: controller.setFileNo),
            space,
            TextDegree(controller: controller.degree, onChanged: controller.setDegree),
            space,
            TextWashMode(controller: controller.mode, onChanged: controller.setMode),
            space,
            TextComment(controller: controller.comment, onChanged: controller.setComment),
            space,
            ElevatedButton(onPressed: controller.onTab, child: const Text("Onayla ve Sıraya Gir"))
          ],
        ),
      ),
    );
  }
}
