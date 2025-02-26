import 'package:hcricket/services/services_exports.dart';


class TimeFormatter {
  static String formatMatchTime(String? timestamp) {
    if (timestamp == null || timestamp.isEmpty) return "Time not available";

    int timeInMillis = int.tryParse(timestamp) ?? 0;
    if (timeInMillis == 0) return "Time not available";

    DateTime matchTime = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
    return DateFormat('hh:mm a').format(matchTime);
  }
}
