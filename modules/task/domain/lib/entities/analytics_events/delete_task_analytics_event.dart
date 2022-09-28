import 'package:task_domain/task_domain.dart';

const _deleteTaskAnalyticsEventName = 'delete_task';

class DeleteTaskAnalyticsEvent extends AnalyticsEvent {
  DeleteTaskAnalyticsEvent(UuidValue taskId)
      : super(
          name: _deleteTaskAnalyticsEventName,
          parameters: {
            'task_id': "$taskId",
          },
        );
}
