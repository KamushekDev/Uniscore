import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uniscore/services/firebase/firebase_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

  late final FirebaseService _fs;

  @override
  void initState(){
    super.initState();

    _fs = GetIt.I.get<FirebaseService>();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile',
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
