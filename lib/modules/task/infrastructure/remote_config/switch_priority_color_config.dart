import 'package:firebase_remote_config/firebase_remote_config.dart';

const _remoteConfigSwitchPriorityColor = 'switch_priority_color';

class SwitchPriorityColorConfig {
  SwitchPriorityColorConfig() {
    value = FirebaseRemoteConfig.instance.getBool(
      _remoteConfigSwitchPriorityColor,
    );
  }

  late final bool value;
}
