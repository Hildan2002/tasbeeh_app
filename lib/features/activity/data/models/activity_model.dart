import 'package:tasbeeh_app/features/activity/domain/entities/activity.dart';

class ActivityModel extends Activity {
  const ActivityModel({
    super.id,
    required super.title,
    required super.currentValue,
    super.reminder,
    super.targetValue,
    super.note,
  });
}
