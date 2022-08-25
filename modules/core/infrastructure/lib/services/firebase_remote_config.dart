import 'package:core_domain/core_domain.dart';
import 'package:core_infrastructure/core_infrastructure.dart';

class FirebaseRemoteConfigProvider implements Initializable {
  FirebaseRemoteConfigProvider(this.configs);

  final Iterable<RemoteConfig> configs;

  late final FirebaseRemoteConfig remoteConfig;

  @override
  Future<void> initialize() async {
    remoteConfig = FirebaseRemoteConfig.instance;

    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 5),
    ));

    await remoteConfig.setDefaults(
      configs.fold(
        <String, dynamic>{},
        (previousValue, element) =>
            previousValue..addAll({element.name: element.defaultValue}),
      ),
    );

    await remoteConfig.fetchAndActivate();
    for (final config in configs) _initializeConfig(config);

    Logger('$runtimeType').info('Service initialized');
  }

  void _initializeConfig<T>(RemoteConfig config) {
    final value = remoteConfig.getValue(config.name);

    if (config.defaultValue is bool) {
      config.currentValue = value.asBool() as T;
      return;
    }

    if (config.defaultValue is double) {
      config.currentValue = value.asDouble() as T;
      return;
    }

    if (config.defaultValue is int) {
      config.currentValue = value.asInt() as T;
      return;
    }

    if (config.defaultValue is String) {
      config.currentValue = value.asString() as T;
      return;
    }

    throw UnimplementedError();
  }
}
