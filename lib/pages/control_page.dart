import 'package:englishcard/pages/home_page.dart';
import 'package:englishcard/values/app_assets.dart';
import 'package:englishcard/values/app_colors.dart';
import 'package:englishcard/values/app_styles.dart';
import 'package:flutter/material.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double sliderValue = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.lightBlue,
      appBar: AppBar(
        backgroundColor: appColors.lightBlue,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomePage()));
          },
          child: Image.asset(appAssets.leftArrow),
        ),
        title: Text(
          'Control',
          style: appStyles.h3.copyWith(color: appColors.textColor),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              child: Text(
                'How much a number word at once',
                style: appStyles.h5.copyWith(color: appColors.lightGrey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                '${sliderValue.toInt()}',
                style: appStyles.h1.copyWith(
                    color: appColors.primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Slider(
                  value: sliderValue,
                  min: 5,
                  max: 100,
                  divisions: 95, //chia cay slider thanh tung doan nho
                  activeColor: appColors.primaryColor,
                  inactiveColor: appColors.lightGrey,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      sliderValue = value;
                    });
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                'slide to set',
                style: appStyles.h5.copyWith(color: appColors.lightGrey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
