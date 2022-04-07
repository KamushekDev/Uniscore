import 'package:crescore/grpc/moq/moq_models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GradedContentWidget extends StatelessWidget {
  final GradedContent data;

  static DateFormat dateFormat = DateFormat.MMMMd();

  const GradedContentWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var grades = data.grades
        .map(
          (grade) => Column(
            children: [
              Text(grade.gradeSystem.name, style: Theme.of(context).textTheme.caption),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Chip(
                  label: Text(grade.value),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
        )
        .toList();

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
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
                  Text(Helper.getContentTypeString(data.contentType)),
                  const SizedBox(width: 16, height: 1),
                  Text(data.user.name),
                  const Spacer(),
                  Text(dateFormat.format(data.dateTime.toLocal())),
                ],
              ),
              const SizedBox(height: 16, width: double.infinity),
              Align(
                child: Text(
                  data.contentName,
                  style: Theme.of(context).textTheme.headline6,
                ),
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(height: 4, width: double.infinity),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  data.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
              const SizedBox(height: 16, width: double.infinity),
              // Wrap(
              Row(
                // runAlignment: WrapAlignment.spaceBetween,
                // alignment: WrapAlignment.spaceBetween,
                // crossAxisAlignment: WrapCrossAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: grades,
              )
            ],
          ),
        ),
      ),
    );
  }
}
