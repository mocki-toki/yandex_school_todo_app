import 'package:firebase_remote_config/firebase_remote_config.dart';

const _firebaseRemoteConfigSwitchPriorityColor = 'switch_priority_color';

class SwitchPriorityColorConfig {
  SwitchPriorityColorConfig() {
    value = FirebaseRemoteConfig.instance.getBool(
      _firebaseRemoteConfigSwitchPriorityColor,
    );
  }

  late final bool value;
}
