class SubscriptionActivityModel {
  final String activityId;
  final DateTime activityDate;

  SubscriptionActivityModel(
      {required this.activityId, required this.activityDate});

  Map<String, dynamic> toJson() => {
        'activityId': activityId,
        'activityDate': activityDate.millisecondsSinceEpoch,
      };
}
