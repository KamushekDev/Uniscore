import 'package:flutter/material.dart';

class InstantPageRoute extends MaterialPageRoute{
  InstantPageRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);


}