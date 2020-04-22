String parseDate(DateTime dateTime) {
  return "${dateTime.day.toString()} ${_month(dateTime.month)} ${dateTime.year}";
}

String _month(int m) {
  assert(m >= 1 && m <= 12);
  return [
    "Jan.",
    "Feb.",
    "Mar.",
    "Apr.",
    "May",
    "June",
    "July",
    "Aug.",
    "Sept.",
    "Oct.",
    "Nov.",
    "Dec."
  ][m - 1];
}
