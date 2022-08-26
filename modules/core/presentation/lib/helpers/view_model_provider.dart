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

class ViewModelProvider<T extends BlocBase> extends BlocProvider<T> {
  ViewModelProvider(
    CreateProviderCallback<T> create, {
    super.key,
    super.child,
  }) : super(create: (context) => _createProvider(create, context));
}