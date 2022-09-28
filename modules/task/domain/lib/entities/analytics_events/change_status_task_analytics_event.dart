import 'package:task_domain/task_domain.dart';

const _changeStatusTaskAnalyticsEventName = 'change_status_task';

class ChangeStatusTaskAnalyticsEvent extends AnalyticsEvent {
  ChangeStatusTaskAnalyticsEvent(UuidValue taskId, {required bool done})
      : super(
          name: _changeStatusTaskAnalyticsEventName,
          parameters: {
            'task_id': "$taskId",
            'task_done': done,
          },
        );
}
