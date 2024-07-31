import 'package:laundry/domain/model/video.dart';
import 'package:url_launcher/url_launcher.dart';

extension VideoUrlLaunch on Video {
  Future<void> launch() async {
    try {
      final videoUrl = Uri.parse(url.trim());

      if (await canLaunchUrl(videoUrl)) {
        await launchUrl(videoUrl, mode: LaunchMode.externalApplication);
      } else {
        throw Exception("Video url hatası");
      }
    } catch (e) {
      rethrow;
    }
  }
}
