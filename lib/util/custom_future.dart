import 'package:flutter/material.dart';
import 'package:laundry/presentation/widget/progress_bar.dart';

class AppFutureBuilder<T> extends StatelessWidget {
  const AppFutureBuilder({
    super.key,
    required this.future,
    required this.onSuccess,
    this.onError,
    this.onEmpty,
    this.loadingWidget = const AppCircleProgress(),
  });

  final Future<T>? future;
  final Widget Function(AsyncSnapshot<T> snapshot) onSuccess;
  final Widget Function(Object? error)? onError;
  final Widget Function()? onEmpty;
  final Widget loadingWidget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return onError != null ? onError!(snapshot.error) : Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return onEmpty != null ? onEmpty!() : const Text('No data available');
        }

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return loadingWidget;
          case ConnectionState.done:
            return onSuccess(snapshot);
          default:
            return const SizedBox();
        }
      },
    );
  }
}
