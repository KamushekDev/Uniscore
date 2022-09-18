import 'package:Uniscore/grpc/backendServiceInterface.dart';
import 'package:Uniscore/models/gradable_content.dart';
import 'package:Uniscore/models/user_graded_content.dart';
import 'package:Uniscore/widgets/async_snapshot_landing_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class UserGradedContentPage extends StatefulWidget {
  static const String routeName = "/gradedContent";
  static const String name = "GradedContent";

  const UserGradedContentPage(this._model, {Key? key}) : super(key: key);

  final UserGradedContent _model;

  @override
  State<UserGradedContentPage> createState() => _UserGradedContentPageState();
}

class _UserGradedContentPageState extends State<UserGradedContentPage> {
  final DateFormat _dateFormat = DateFormat.MMMMd();

  late final IBackendService _bs;

  @override
  void initState() {
    _bs = GetIt.I.get<IBackendService>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget._model.type.name, style: Theme.of(context).textTheme.labelMedium),
            SizedBox.fromSize(size: Size(32, 0)),
            Text(widget._model.user.username, style: Theme.of(context).textTheme.labelMedium),
            Spacer(),
            Text(_dateFormat.format(DateTime.now()), style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
      body: FutureBuilder(
        future: _bs.getContent(widget._model.id),
        builder: (c, snapshot) => AsyncSnapshotLanding(
          snapshot,
          (GradableContent data) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        data.title,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    if (data.description != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(data.description!, style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    SizedBox.fromSize(size: Size.fromHeight(16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Заказал:",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox.fromSize(size: Size(4, 0)),
                        Text(
                          "Kamushek324",
                          style: Theme.of(context).textTheme.bodyLarge?.merge(TextStyle(color: Theme.of(context).colorScheme.secondary)),
                        ),
                      ],
                    ),
                    SizedBox.fromSize(size: Size.fromHeight(32)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("ВAША ШКАЛА", style: Theme.of(context).textTheme.labelSmall),
                            SizedBox.fromSize(size: Size(0, 4)),
                            Chip(
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              label: Text("Нормуль", style: Theme.of(context).textTheme.labelLarge),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("ДОБРО ИЛИ ЗЛО", style: Theme.of(context).textTheme.labelSmall),
                            SizedBox.fromSize(size: Size(0, 4)),
                            Chip(
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              label: Text("Зло", style: Theme.of(context).textTheme.labelLarge),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("СРЕДНЕЕ ЗНАЧЕНИЕ", style: Theme.of(context).textTheme.labelSmall),
                            SizedBox.fromSize(size: Size(0, 4)),
                            Chip(
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              label: Text("50/100", style: Theme.of(context).textTheme.labelLarge),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
