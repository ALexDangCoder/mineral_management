import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage('assets/images/home_bg.png'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.fromLTRB(0, 64, 0, 0),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 212,
                      height: 34,
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const Text(
                        "DESIGN SYSTEM",
                        style: XelaTextStyle.XelaSmallBodyBold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                      child: Text(
                        "Perfectly shaped UI kit for Flutter App with reusable components for your next mobile and desktop apps.\nSaves time and helps teams and indiehackers to release Flutter applications faster.",
                        textAlign: TextAlign.center,
                        style: XelaTextStyle.XelaBody.apply(
                            color: XelaColor.Gray2),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
