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
  return '$y-$m-$d';
}

bool isValidDateRange(DateTime date) {
  final DateTime today = DateTime.now();
  const int earliestYear = 1900;
  return date.year >= earliestYear && !today.isBefore(date);
}
