import 'package:Uniscore/widgets/something_wrong_widget.dart';
import 'package:flutter/material.dart';

class AsyncSnapshotLanding<TData> extends StatelessWidget {
  final Widget Function(TData) _childBuilder;
  final AsyncSnapshot _snapshot;

  const AsyncSnapshotLanding(this._snapshot, this._childBuilder, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (_snapshot.connectionState) {
      case ConnectionState.waiting:
        return const Center(child: CircularProgressIndicator.adaptive());
      case ConnectionState.done:
        {
          if (_snapshot.hasData) {
            if (_snapshot.data != null) {
              return _childBuilder(_snapshot.data);
            }
            return const SomethingWrongWidget();
          }
          if (_snapshot.hasError) {
            return SomethingWrongWidget(message: _snapshot.error.toString());
          }
          return const SomethingWrongWidget();
        }
      case ConnectionState.none:
      case ConnectionState.active:
        return SomethingWrongWidget(message: "Snapshot state is ${_snapshot.connectionState}");
    }
  }
}
