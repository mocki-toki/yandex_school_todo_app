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

class ViewModelInputProvider<T extends BlocBase, Input>
    extends BlocInputProvider<T, Input> {
  ViewModelInputProvider(
    CreateProviderCallback<T> create, {
    super.key,
    required super.input,
    required super.child,
  }) : super(create: (context, _) => _createProvider(create, context));
}
