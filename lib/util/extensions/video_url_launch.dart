import 'package:laundry/domain/model/video.dart';
import 'package:url_launcher/url_launcher.dart';

extension VideoUrlLaunch on Video {
  Future<void> launch() async {
    try {
      // TODO: Hatayı çöz
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
/**
 * _launchURL(youtubeId) async {
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse('youtube://www.youtube.com/watch?v=$youtubeId'))) {
        await launchUrl(Uri.parse('youtube://www.youtube.com/watch?v=$youtubeId'));
      } else {
        if (await canLaunchUrl(Uri.parse('https://www.youtube.com/watch?v=$youtubeId'))) {
          await launchUrl(Uri.parse('https://www.youtube.com/watch?v=$youtubeId'));
        } else {
          throw 'Could not launch https://www.youtube.com/watch?v=$youtubeId';
        }
      }
    } else {
      String url = 'https://www.youtube.com/watch?v=$youtubeId';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }
  }
 */