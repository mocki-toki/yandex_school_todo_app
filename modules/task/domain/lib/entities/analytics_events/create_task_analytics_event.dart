import 'package:task_domain/task_domain.dart';

const _createTaskAnalyticsEventName = 'create_task';

class CreateTaskAnalyticsEvent extends AnalyticsEvent {
  CreateTaskAnalyticsEvent(UuidValue taskId)
      : super(
          name: _createTaskAnalyticsEventName,
          parameters: {
            'task_id': "$taskId",
          },
        );
}
