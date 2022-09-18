import 'package:flutter/material.dart';
import 'package:Uniscore/models/user_graded_content.dart';
import 'package:intl/intl.dart';

class GradedContentCard extends StatelessWidget {
  final UserGradedContent _content;

  const GradedContentCard(this._content, {Key? key}) : super(key: key);

  static final DateFormat _dateFormat = DateFormat.MMMMd();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding:
        const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Игра"),
                const SizedBox(width: 16, height: 1),
                Text(_content.user.username),
                const Spacer(),
                // Text(dateFormat.format(data.dateTime.toLocal())),
                Text(_dateFormat.format(DateTime.now())),
              ],
            ),
            const SizedBox(height: 16, width: double.infinity),
            Align(
              child: Text(
                _content.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              alignment: Alignment.centerLeft,
            ),
            const SizedBox(height: 4, width: double.infinity),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Description",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
            const SizedBox(height: 16, width: double.infinity),
            // Wrap(
            // Row(
            //   // runAlignment: WrapAlignment.spaceBetween,
            //   // alignment: WrapAlignment.spaceBetween,
            //   // crossAxisAlignment: WrapCrossAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: grades,
            // )
          ],
        ),
      ),
    );
  }
  
}