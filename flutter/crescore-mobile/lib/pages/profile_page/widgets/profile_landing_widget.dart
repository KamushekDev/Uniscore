import 'package:Uniscore/pages/profile_page/Models/profile_landing_model.dart';
import 'package:Uniscore/pages/profile_page/widgets/profile_app_bar.dart';
import 'package:Uniscore/pages/profile_page/widgets/profile_head_widget.dart';
import 'package:Uniscore/pages/profile_page/widgets/profile_stats_widget.dart';
import 'package:Uniscore/pages/profile_page/widgets/profile_tabs_widget.dart';
import 'package:flutter/material.dart';

class ProfileLanding extends StatelessWidget {
  const ProfileLanding(this._model, {Key? key, this.openSettingsDrawer}) : super(key: key);

  final ProfileLandingModel _model;
  final void Function()? openSettingsDrawer;

  @override
  Widget build(BuildContext context) {
    var appBarHeight = 125.0;
    var avatarRadius = 52.0;
    var contentPadding = appBarHeight - avatarRadius;

    return Stack(
      children: [
        ProfileAppBar(appBarHeight, cornerRadius: 20, cutoutRadius: 60, onMenuButtonPressed: openSettingsDrawer),
        Column(
          children: [
            SizedBox.fromSize(size: Size.fromHeight(contentPadding)),
            ProfileHead(_model.profileHead),
            ProfileStats(_model.profileStats),
            ProfileTabs(_model.profileTabs),
          ],
        ),
      ],
    );
  }
}
