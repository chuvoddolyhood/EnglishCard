import 'package:englishcard/pages/home_page.dart';
import 'package:englishcard/values/app_assets.dart';
import 'package:englishcard/values/app_colors.dart';
import 'package:englishcard/values/app_styles.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   title: new Text('data'),
      // ),
      backgroundColor: appColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.bottomCenter,
              // color: Colors.red,
              child: Text(
                'Welcome to',
                style: appStyles.h3,
              ),
            )),
            Expanded(
                child: Container(
              // color: Colors.yellow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      'English',
                      style: appStyles.h2.copyWith(
                          color: appColors.blackGrey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 86),
                    child: Text(
                      'Card',
                      style: appStyles.h4.copyWith(height: 0.5),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: RawMaterialButton(
                fillColor: appColors.lightBlue,
                shape: CircleBorder(),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => HomePage()));

                  //Xoa context cua landing page
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => HomePage()),
                      (route) => false);
                },
                child: Image.asset(appAssets.rightArrow),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
