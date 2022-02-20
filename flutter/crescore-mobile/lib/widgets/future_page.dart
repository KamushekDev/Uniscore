import 'package:flutter/material.dart';

class FuturePage<TFutureResult> extends StatefulWidget {
  final Future<TFutureResult> _future;
  final Widget Function(TFutureResult) _onData;

  const FuturePage(Future<TFutureResult> future,
      Widget Function(TFutureResult) onData,
      {Key? key})
      : _future = future,
        _onData = onData,
        super(key: key);

  @override
  State<FuturePage<TFutureResult>> createState() =>
      _FuturePageState<TFutureResult>();
}

class _FuturePageState<TFutureResult> extends State<FuturePage<TFutureResult>> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
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
