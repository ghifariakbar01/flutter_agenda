extension DateTimeExtension on DateTime {
  String toDateString() {
    return "${this.day}/${this.month}/${this.year}";
  }
}
