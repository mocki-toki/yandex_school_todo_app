import 'package:task_domain/task_domain.dart';

const _editTaskAnalyticsEventName = 'edit_task';

class EditTaskAnalyticsEvent extends AnalyticsEvent {
  EditTaskAnalyticsEvent(UuidValue taskId)
      : super(
          name: _editTaskAnalyticsEventName,
          parameters: {
            'task_id': "$taskId",
          },
        );
}
