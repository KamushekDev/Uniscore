import 'package:Uniscore/pages/profile_page/Models/profile_information_tab_model.dart';
import 'package:flutter/material.dart';

class ProfileInformationTab extends StatelessWidget {
  const ProfileInformationTab(this._model, {Key? key}) : super(key: key);

  final ProfileInformationTabModel _model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(_model.information),
      ),
    );
  }
}
