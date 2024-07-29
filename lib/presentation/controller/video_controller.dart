import 'package:get/get.dart';
import 'dart:convert'; // For JSON decoding
import 'package:flutter/services.dart' show rootBundle;
import 'package:laundry/domain/model/video.dart'; // To load JSON from assets

class VideoController extends GetxController {
  var videos = <Video>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchVideoList();
  }

  Future<void> fetchVideoList() async {
    String jsonString = await rootBundle.loadString('assets/data/video/video.json');
    List<dynamic> jsonResponse = json.decode(jsonString);

    videos.value = jsonResponse.map((video) => Video.fromJson(video)).toList();
  }
}
