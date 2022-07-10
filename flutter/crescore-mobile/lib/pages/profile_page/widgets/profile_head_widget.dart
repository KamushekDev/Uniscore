import 'package:Uniscore/pages/profile_page/Models/profile_head_model.dart';
import 'package:Uniscore/pages/profile_page/widgets/user_avatar_widget.dart';
import 'package:flutter/material.dart';

class ProfileHead extends StatelessWidget {
  final ProfileHeadModel _model;

  const ProfileHead(this._model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserAvatar(50, null),
        Text(
          _model.username,
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
