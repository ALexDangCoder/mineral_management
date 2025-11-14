import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates/analytics.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates/checkout.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates/data_table.dart' as XelaDataTable;
import 'package:bnv_opendata/presentation/xelauikit_screens/templates/ecommerce.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates/job_search.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates/mailbox.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates/music_service.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates/social.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates/task_manager.dart';
import 'package:bnv_opendata/presentation/xelauikit_screens/templates/tasks_projects.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_alert.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class TemplatesScreen extends StatefulWidget {
  const TemplatesScreen({Key? key}) : super(key: key);

  @override
  _TemplatesScreenState createState() => _TemplatesScreenState();
}

class _TemplatesScreenState extends State<TemplatesScreen> {
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Text(
          "App templates made with care of usability and attention to details",
          style: XelaTextStyle.xelaSmallBody.apply(color: XelaColor.Gray6)),
    ));

    children.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: XelaAlert(
        title: 'Attention!',
        text:
            "Templates are an example of using components and are not fully functional elements",
        leftIcon: const Icon(
          Icons.info,
          color: XelaColor.Blue7,
        ),
        primaryColor: XelaColor.Blue7,
        secondaryColor: XelaColor.Gray6,
        background: XelaColor.Gray12, id: '',
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Data Table",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => XelaDataTable.DataTable()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Tasks Projects",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TasksProjects()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Job Search",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JobSearch()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Analytics",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Analytics()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Mailbox",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Mailbox()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Task Manager",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskManager()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Music Service",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MusicService()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Ecommerce",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Ecommerce()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Checkout",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Checkout()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: XelaButton(
        text: "Social",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Social()),
          );
        },
        horizontalAlignment: MainAxisAlignment.start,
        size: XelaButtonSize.MEDIUM,
        background: XelaColor.Gray12,
        foregroundColor: XelaColor.Gray2,
        autoResize: false,
      ),
    ));

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Templates",
                style: XelaTextStyle.xelaHeadline.apply(color: XelaColor.Gray2),
              )),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: children,
          ))
        ],
      ),
    ));
  }
}
