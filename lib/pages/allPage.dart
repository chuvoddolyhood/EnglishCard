import 'package:englishcard/models/english_today.dart';
import 'package:englishcard/values/app_assets.dart';
import 'package:englishcard/values/app_colors.dart';
import 'package:englishcard/values/app_styles.dart';
import 'package:flutter/material.dart';

class allPage extends StatelessWidget {
  final List<EnglishToday> words;
  const allPage({Key? key, required this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
          itemCount: words.length,
          itemBuilder: (context, index) {
            return Container(
              color:
                  index % 2 == 0 ? appColors.primaryColor : appColors.lightBlue,
              child: ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: words[index].isFavorite ? Colors.red : Colors.grey,
                ),
                title: Text(words[index].noun!),
                subtitle: Text(words[index].quote ??
                    '"Think of all the beauty still left around you and be happy"'),
                contentPadding: EdgeInsets.all(10),
              ),
            );
          }),
    );
  }
}
