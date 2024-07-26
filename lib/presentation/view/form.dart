import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/form_controller.dart';
import 'package:laundry/presentation/widget/text_form_fields/text_comment.dart';
import 'package:laundry/presentation/widget/text_form_fields/text_degree.dart';
import 'package:laundry/presentation/widget/text_form_fields/text_file_no.dart';
import 'package:laundry/presentation/widget/text_form_fields/text_form_field.dart';
import 'package:laundry/presentation/widget/text_form_fields/text_wash_mod.dart';
import 'package:laundry/util/validator.dart';

class FormView extends GetView<FormController> {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 20);
    final val = AppValidator();

    return Scaffold(
      appBar: AppBar(title: const Text("Yıkama Bilgileri")),
      body: Form(
        key: controller.key,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFileNo(
              controller: controller.fileNo,
              onChanged: (_) => "",
              validator: (value) => val.isNull(value),
            ),
            space,
            TextDegree(
              controller: controller.degree,
              onChanged: (_) => "",
              validator: (value) => val.isNull(value),
            ),
            space,
            TextWashMode(
              controller: controller.mode,
              onChanged: (_) => "",
              validator: (value) => val.isNull(value),
            ),
            space,
            AppTextField(
              onChanged: (_) => "",
              controller: controller.modeDry,
              hintText: "Kurutma türünü giriniz",
              labelText: "Kurutma Türü",
              keyboardType: TextInputType.text,
              validator: (value) => val.isNull(value),
            ),
            space,
            TextComment(
              controller: controller.comment,
              onChanged: (_) => "",
              validator: (_) => null,
            ),
            space,
            ElevatedButton(onPressed: controller.onTab, child: const Text("Onayla ve Sıraya Gir"))
          ],
        ),
      ),
    );
  }
}
