import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/widgets/xela_blocks/cryptocurrency_1.dart';
import 'package:bnv_opendata/widgets/xela_blocks/cryptocurrency_2.dart';
import 'package:bnv_opendata/widgets/xela_blocks/cryptocurrency_3.dart';
import 'package:bnv_opendata/widgets/xela_blocks/ecommerce_cards.dart';
import 'package:bnv_opendata/widgets/xela_blocks/filter_1.dart';
import 'package:bnv_opendata/widgets/xela_blocks/filter_2.dart';
import 'package:bnv_opendata/widgets/xela_blocks/form_1.dart';
import 'package:bnv_opendata/widgets/xela_blocks/form_2.dart';
import 'package:bnv_opendata/widgets/xela_blocks/form_3.dart';
import 'package:bnv_opendata/widgets/xela_blocks/form_4.dart';
import 'package:bnv_opendata/widgets/xela_blocks/music_app_1.dart';
import 'package:bnv_opendata/widgets/xela_blocks/music_app_2.dart';
import 'package:bnv_opendata/widgets/xela_blocks/music_app_3.dart';
import 'package:bnv_opendata/widgets/xela_blocks/side_bar_1.dart';
import 'package:bnv_opendata/widgets/xela_blocks/side_bar_2.dart';
import 'package:bnv_opendata/widgets/xela_blocks/side_bar_3.dart';
import 'package:bnv_opendata/widgets/xela_blocks/social_media_cards.dart';
import 'package:bnv_opendata/widgets/xela_blocks/users_list_1.dart';
import 'package:bnv_opendata/widgets/xela_blocks/users_list_2.dart';
import 'package:bnv_opendata/widgets/xela_blocks/users_list_3.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_alert.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class BlocksScreen extends StatefulWidget {
  const BlocksScreen({Key? key}) : super(key: key);

  @override
  _BlocksScreenState createState() => _BlocksScreenState();
}

class _BlocksScreenState extends State<BlocksScreen> {
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Text(
          'Our Xela Blocks help to make beautiful apps. They are super easy to use and customize. You can freely combine them and quickly build a gorgeous project.',
          style: XelaTextStyle.xelaSmallBody.apply(color: XelaColor.Gray6)),
    ));

    children.add(const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: XelaAlert(
        title: 'Attention!',
        text:
            'Blocks are an example of using components and are not fully functional elements',
        leftIcon: Icon(
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
        text: 'SideBar #1',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SideBar1()),
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
        text: 'SideBar #2',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SideBar2()),
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
        text: 'SideBar #3',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SideBar3()),
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
        text: 'Form #1',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Form1()),
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
        text: 'Form #2',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Form2()),
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
        text: 'Form #3',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Form3()),
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
        text: 'Form #4',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Form4()),
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
        text: 'Filter #1',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Filter1()),
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
        text: 'Filter #2',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Filter2()),
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
        text: 'Ecommerce cards',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EcommerceCards()),
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
        text: 'Users list #1',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UsersList1()),
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
        text: 'Users list #2',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UsersList2()),
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
        text: 'Users list #3',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UsersList3()),
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
        text: 'Social Media Cards',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SocialMediaCards()),
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
        text: 'Music App #1',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MusicApp1()),
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
        text: 'Music App #2',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MusicApp2()),
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
        text: 'Music App #3',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MusicApp3()),
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
        text: 'Cryptocurrency #1',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cryptocurrency1()),
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
        text: 'Cryptocurrency #2',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cryptocurrency2()),
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
        text: 'Cryptocurrency #3',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cryptocurrency3()),
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
                'Blocks',
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
