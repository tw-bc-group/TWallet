String parseDate(DateTime dateTime) {
  return "${dateTime.day.toString()} ${_month(dateTime.month)} ${dateTime.year}";
}

String parseDateTime(DateTime dateTime) {
  final hour = toLengthTwo(dateTime.hour);
  final minute = toLengthTwo(dateTime.minute);
  final second = toLengthTwo(dateTime.second);
  return '${dateTime.day} ${_month(dateTime.month)} ${dateTime.year} $hour:$minute:$second';
}

String toLengthTwo(int value) {
  if (value < 10) {
    return '0$value';
  }
  return value.toString();
}

String _month(int m) {
  assert(m >= 1 && m <= 12);
  return [
    "Jan,",
    "Feb,",
    "Mar,",
    "Apr,",
    "May,",
    "June,",
    "July,",
    "Aug,",
    "Sept,",
    "Oct,",
    "Nov,",
    "Dec,"
  ][m - 1];
}
