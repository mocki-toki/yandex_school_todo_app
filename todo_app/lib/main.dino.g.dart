// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Dino Generator
// **************************************************************************

// ignore_for_file: unnecessary_import

import 'package:dino/dino.dart';
import 'package:app_presentation/navigation/router_delegate.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/src/widgets/router.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:core_presentation/mixins/navigator_mixin.dart';
import 'package:task_presentation/mixins/navigator_mixin.dart';
import 'package:core_infrastructure/services/device_identifier_provider.dart';
import 'package:dino/src/lifecycle/lifecycle.dart';
import 'package:core_infrastructure/services/dio_provider.dart';
import 'package:core_infrastructure/services/firebase_analytics_provider.dart';
import 'package:core_domain/entities/device_identifier.dart';
import 'package:core_infrastructure/services/firebase_analytics_service_impl.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:core_domain/services/firebase_analytics_service.dart';
import 'package:task_infrastructure/backend/storage_task_properties_backend.dart';
import 'package:task_infrastructure/backend/storage_task_backend.dart';
import 'package:task_infrastructure/backend/network_task_backend.dart';
import 'package:dio/src/dio.dart';
import 'package:task_infrastructure/services/task_properties_repository.dart';
import 'package:task_domain/services/task_properties_repository.dart';
import 'package:task_infrastructure/services/task_repository_impl.dart';
import 'package:task_domain/services/task_repository.dart';
import 'package:task_domain/entities/remote_configs/switch_priority_color_remote_config.dart';
import 'package:core_domain/entities/remote_config.dart';
import 'package:core_infrastructure/services/firebase_remote_config.dart';

class $ServiceCollection extends RuntimeServiceCollection {
  @override
  void addGenerated<TService extends Object>(ServiceLifetime lifetime,
      [bool registerAliases = true]) {
    switch (TService) {
      case AppRouterDelegate:
        addFactory<AppRouterDelegate>(
          lifetime,
          (provider) => AppRouterDelegate(
            provider.getRequired<FirebaseAnalyticsObserver>(),
          ),
          true,
        );

        if (registerAliases) {
          addAlias<RouterDelegate, AppRouterDelegate>(true);
          addAlias<Listenable, AppRouterDelegate>(true);
          addAlias<CoreNavigatorMixin, AppRouterDelegate>(true);
          addAlias<TaskNavigatorMixin, AppRouterDelegate>(true);
          addAlias<PopNavigatorRouterDelegateMixin, AppRouterDelegate>(true);
        }

        break;
      case DeviceIdentifierProvider:
        addFactory<DeviceIdentifierProvider>(
          lifetime,
          (provider) => DeviceIdentifierProvider(),
          true,
        );

        if (registerAliases) {
          addAlias<Initializable, DeviceIdentifierProvider>(true);
        }

        break;
      case DioProvider:
        addFactory<DioProvider>(
          lifetime,
          (provider) => DioProvider(),
          true,
        );
        break;
      case FirebaseAnalyticsProvider:
        addFactory<FirebaseAnalyticsProvider>(
          lifetime,
          (provider) => FirebaseAnalyticsProvider(
            provider.getRequired<DeviceIdentifier>(),
          ),
          true,
        );

        if (registerAliases) {
          addAlias<Initializable, FirebaseAnalyticsProvider>(true);
        }

        break;
      case FirebaseAnalyticsServiceImpl:
        addFactory<FirebaseAnalyticsServiceImpl>(
          lifetime,
          (provider) => FirebaseAnalyticsServiceImpl(
            provider.getRequired<FirebaseAnalytics>(),
          ),
          true,
        );

        if (registerAliases) {
          addAlias<FirebaseAnalyticsService, FirebaseAnalyticsServiceImpl>(
              true);
        }

        break;
      case StorageTaskPropertiesBackend:
        addFactory<StorageTaskPropertiesBackend>(
          lifetime,
          (provider) => StorageTaskPropertiesBackend(),
          true,
        );

        if (registerAliases) {
          addAlias<Initializable, StorageTaskPropertiesBackend>(true);
        }

        break;
      case StorageTaskBackend:
        addFactory<StorageTaskBackend>(
          lifetime,
          (provider) => StorageTaskBackend(),
          true,
        );

        if (registerAliases) {
          addAlias<Initializable, StorageTaskBackend>(true);
        }

        break;
      case NetworkTaskBackend:
        addFactory<NetworkTaskBackend>(
          lifetime,
          (provider) => NetworkTaskBackend(
            provider.getRequired<Dio>(),
          ),
          true,
        );
        break;
      case TaskPropertiesRepositoryImpl:
        addFactory<TaskPropertiesRepositoryImpl>(
          lifetime,
          (provider) => TaskPropertiesRepositoryImpl(
            provider.getRequired<StorageTaskPropertiesBackend>(),
          ),
          true,
        );

        if (registerAliases) {
          addAlias<TaskPropertiesRepository, TaskPropertiesRepositoryImpl>(
              true);
        }

        break;
      case TaskRepositoryImpl:
        addFactory<TaskRepositoryImpl>(
          lifetime,
          (provider) => TaskRepositoryImpl(
            provider.getRequired<StorageTaskBackend>(),
            provider.getRequired<NetworkTaskBackend>(),
          ),
          true,
        );

        if (registerAliases) {
          addAlias<TaskRepository, TaskRepositoryImpl>(true);
        }

        break;
      case SwitchPriorityColorRemoteConfig:
        addFactory<SwitchPriorityColorRemoteConfig>(
          lifetime,
          (provider) => SwitchPriorityColorRemoteConfig(),
          true,
        );

        if (registerAliases) {
          addAlias<RemoteConfig, SwitchPriorityColorRemoteConfig>(true);
        }

        break;
      case FirebaseRemoteConfigProvider:
        addFactory<FirebaseRemoteConfigProvider>(
          lifetime,
          (provider) => FirebaseRemoteConfigProvider(
            provider.getIterable<RemoteConfig<dynamic>>(),
          ),
          true,
        );

        if (registerAliases) {
          addAlias<Initializable, FirebaseRemoteConfigProvider>(true);
        }

        break;
    }
  }
}
