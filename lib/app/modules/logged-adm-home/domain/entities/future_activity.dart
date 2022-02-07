class FutureActivity {
  final String activityName;
  final String activityDate;
  final String activityTime;
  final String? activityRemainTime;

  FutureActivity(
      {required this.activityName,
      required this.activityDate,
      required this.activityTime,
      this.activityRemainTime});

  factory FutureActivity.newInstance() {
    return FutureActivity(
        activityDate: '',
        activityName: '',
        activityTime: '',
        activityRemainTime: null);
  }
}
