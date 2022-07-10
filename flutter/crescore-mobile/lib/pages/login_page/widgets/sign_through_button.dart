import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignThroughButton extends StatelessWidget {
  final String _source;
  final void Function()? _onSignIn;
  final AssetImage _asset;
  final Color _backgroundColor;

  const SignThroughButton(this._source, this._backgroundColor, this._asset, this._onSignIn, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(height: 48),
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_backgroundColor),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 32),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image(
                    image: _asset,
                  ),
                ),
              ),
              Text(_source, style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
            ],
          ),
          onPressed: _onSignIn,
        ),
      ),
    );
  }
}
