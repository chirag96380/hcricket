import 'package:hcricket/services/services_exports.dart';

class UpcomingMatchesDateFormatter {
  String formatTimestamp(dynamic pubTime) {
    if (pubTime == null || pubTime == 0) return "Unknown date";

    int timestamp;
    if (pubTime is String) {
      timestamp = int.tryParse(pubTime) ?? 0;
    } else if (pubTime is int) {
      timestamp = pubTime;
    } else {
      return "Invalid date";
    }

    if (timestamp == 0) return "Unknown date";

    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat('MMM d, yyyy,').format(date);
  }
}