import 'package:core_presentation/core_presentation.dart';

typedef CreateProviderCallback<T> = T Function(
  BuildContext context,
  ServiceProvider provider,
);

T _createProvider<T>(
  CreateProviderCallback<T> create,
  BuildContext context,
) {
  return create(context, context.sp);
}

class ViewModelProvider<T extends BlocBase> extends ProxyProvider0<T> {
  ViewModelProvider(
    CreateProviderCallback<T> create, {
    super.key,
    super.child,
  }) : super(update: (context, _) => _createProvider(create, context));
}
