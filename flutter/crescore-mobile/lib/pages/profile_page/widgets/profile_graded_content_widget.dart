import 'package:Uniscore/models/user_graded_content.dart';
import 'package:Uniscore/pages/user_graded_content_page/user_graded_content_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileGradedContent extends StatelessWidget {
  const ProfileGradedContent(this._model, {Key? key}) : super(key: key);

  final UserGradedContent _model;
  static final DateFormat _dateFormat = DateFormat.MMMMd();

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          title: Text(_model.title),
          subtitle: Text(_model.type.name),
          trailing: Text(_dateFormat.format(DateTime.now())),
          onTap: () => {Navigator.of(context).pushNamed(UserGradedContentPage.routeName, arguments: _model)},
        ));
  }
}
