import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

//ignore_for_file: prefer_const_constructors

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _launchChatGpt() async {
    final Uri chaturl = Uri.parse("openai://chat");

    if (await canLaunchUrl(chaturl)) {
      await launchUrl(chaturl);
    } else {
      final Uri chatWebUrl = Uri.parse("https://chat.openai.com/");
      await launchUrl(chatWebUrl, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(
              35, 1.2 * kBottomNavigationBarHeight, 35, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                shape(4, -0.2),
                shape(-4, -0.2),
                Align(
                  alignment: Alignment(0, -1.1),
                  child: Container(
                    height: 300,
                    width: 600,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container(color: Colors.transparent),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.access_alarms_sharp)),
                      Text(
                        "📌İSTANBUL-BAŞAKŞEHİR",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: _launchChatGpt,
                        child: Text("Good Morning",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                      Image.asset("assets/3.png"),
                      CenterYazi("3°C", 50),
                      CenterYazi("Yağmurlu Hava", 30),
                      CenterYazi("23.02 Cuma ◼️ 20:00 ", 15,
                          fontw: FontWeight.w300),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomRow("11", "Sunrise", "7:43"),
                          CustomRow("12", "Sunset", "20:10"),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.00),
                          child: Divider(
                            color: Colors.purple,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomRow("13", "Max Temp", "-2°C"),
                          CustomRow("14", "Min Temp", " 5°C"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Row CustomRow(String img, String ustYazi, String altYazi) {
    return Row(
      children: [
        Image.asset(
          "assets/$img.png",
          scale: 8,
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextYazi("$ustYazi", fontw: FontWeight.w300),
            SizedBox(height: 3),
            TextYazi("$altYazi"),
          ],
        )
      ],
    );
  }

  Text TextYazi(String yazi, {FontWeight fontw = FontWeight.w700}) {
    return Text(
      "$yazi",
      style: TextStyle(color: Colors.white, fontWeight: fontw),
    );
  }

  Center CenterYazi(String textt, double size,
      {FontWeight fontw = FontWeight.w600}) {
    return Center(
      child: Text(
        "$textt",
        style: TextStyle.new(
          color: Colors.white,
          fontSize: size,
          fontWeight: fontw,
        ),
      ),
    );
  }

  Align shape(double x, double y) {
    return Align(
      alignment: Alignment(x, y),
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
