import 'dart:convert';


class DateTimeUtil {
  static DateTime? utcStringToLocal(String? input) {
    if (input == null || input.isEmpty) return null;
    return DateTime.tryParse(input)?.toLocal();
  }

  static String? localDateTimeToUTCString(DateTime? input) {
    return input?.toUtc().toIso8601String();
  }

  String formatHHMMSS(int seconds) {
    if (seconds == 0) return '0';

    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}

String beautifyJson(dynamic json) {
  try {
    if (json == null) return '';
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(json);
    return prettyprint;
  } catch (e) {
    return json.toString();
  }
}
