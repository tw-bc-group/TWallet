bool isValidDate(String input) {
  try {
    final date = DateTime.parse(input);
    return input == toOriginalFormatString(date) && isValidDateRange(date);
  } catch (e) {
    return false;
  }
}

String toOriginalFormatString(DateTime dateTime) {
  final y = dateTime.year.toString().padLeft(4, '0');
  final m = dateTime.month.toString().padLeft(2, '0');
  final d = dateTime.day.toString().padLeft(2, '0');
  return "$y-$m-$d";
}

bool isValidDateRange(DateTime date) {
  var today = DateTime.now();
  var earlistYear = 1900;
  var latestYear = today.year;
  var latestMonth = today.month;
  var latestDay = today.day;
  return date.year >= earlistYear && date.year <= latestYear && date.month <= latestMonth && date.day <= latestDay;
}
