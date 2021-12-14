import 'package:crescore/widgets/helpers/page_base.dart';
import 'package:flutter/material.dart';

class FuturePage<TFutureResult> extends StatefulWidget {
  final Future<TFutureResult> _future;
  final AppBar _appBar;
  final Widget Function(TFutureResult) _onData;

  const FuturePage(AppBar appBar, Future<TFutureResult> future,
      Widget Function(TFutureResult) onData,
      {Key? key})
      : _future = future,
        _appBar = appBar,
        _onData = onData,
        super(key: key);

  @override
  State<FuturePage<TFutureResult>> createState() =>
      _FuturePageState<TFutureResult>();
}

class _FuturePageState<TFutureResult> extends State<FuturePage<TFutureResult>> {
  @override
  Widget build(BuildContext context) {
    return PageBase(
      widget._appBar,
      FutureBuilder(
        future: widget._future,
        builder: (BuildContext context, AsyncSnapshot<TFutureResult> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.done:
              {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    return widget._onData(snapshot.data!);
                  }
                  return const Text("Data was null");
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return const Text("Snapshot has no data nor error. WTF?!?!");
              }
            case ConnectionState.none:
            case ConnectionState.active:
              return Text("Snapshot state is ${snapshot.connectionState}");
          }
        },
      ),
    );
  }
}
