import 'package:englishcard/models/english_today.dart';
import 'package:englishcard/pages/allPage.dart';
import 'package:englishcard/values/app_assets.dart';
import 'package:englishcard/values/app_colors.dart';
import 'package:englishcard/values/app_styles.dart';
import 'package:englishcard/values/share_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class listWords extends StatelessWidget {
  final List<EnglishToday> words;
  const listWords({Key? key, required this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appColors.lightBlue,
      appBar: AppBar(
        backgroundColor: appColors.lightBlue,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(appAssets.leftArrow),
        ),
        title: Text(
          'Control',
          style: appStyles.h3.copyWith(color: appColors.textColor),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Container(
              height: size.height * 3 / 4,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: words
                    .map((e) => Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: appColors.primaryColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            e.noun ?? '',
                            style: appStyles.h4,
                          ),
                        ))
                    .toList(),
              ),
            ),
            Container(
              height: size.height * 1 / 25,
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => allPage(words: this.words)));
                },
                child: Text('View vertical list'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
