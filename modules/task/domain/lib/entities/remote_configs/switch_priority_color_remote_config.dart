import 'package:task_domain/task_domain.dart';

const _switchPriorityColorRemoteConfigName = 'switch_priority_color';
const _switchPriorityColorRemoteConfigDefault = false;

class SwitchPriorityColorRemoteConfig extends RemoteConfig<bool> {
  SwitchPriorityColorRemoteConfig()
      : super(
          name: _switchPriorityColorRemoteConfigName,
          defaultValue: _switchPriorityColorRemoteConfigDefault,
        );
}
