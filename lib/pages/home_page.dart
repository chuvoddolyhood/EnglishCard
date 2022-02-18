import 'dart:math';

import 'package:englishcard/models/english_today.dart';
import 'package:englishcard/packages/quote.dart';
import 'package:englishcard/packages/quote_model.dart';
import 'package:englishcard/pages/control_page.dart';
import 'package:englishcard/values/app_assets.dart';
import 'package:englishcard/values/app_colors.dart';
import 'package:englishcard/values/app_styles.dart';
import 'package:englishcard/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  late PageController _pageController;

  List<EnglishToday> words = [];

  //Hàm random lay ngau nhien lay 1 tu trong danh sach tu 1-120 tu cho vao 1 mang
  List<int> fixedListRandom({int len = 1, int max = 120, int min = 1}) {
    List<int> newList = [];
    if (len > max || len < min) {
      return [];
    }

    Random random = Random();
    int count = 1;
    while (count <= len) {
      int val = random.nextInt(max);
      if (newList.contains(val)) {
        continue;
      } else {
        newList.add(val);
        count++;
      }
    }
    return newList;
  }

  //Lay danh sach cho vao Model
  getEnglishToday() {
    List<String> newWords = [];
    List<int> rans = fixedListRandom(len: 5, max: nouns.length);
    rans.forEach((element) {
      newWords.add(nouns[element]);
      /**
       * Tại sao add các từ tiếng anh từ nouns vào newWords mà ko phải words?
       * - Vì KDL của rans là Int khi qua nouns[element] -> từ tiếng Anh bất kỳ 
       * dạng String nên match với KDL mảng newWords dạng String. Trong khi đó KDL words dạng model EnglishToday
       * 
       * - Sau đó mới chuyển KDL sang words bằng hàm map
       */
    });

    words = newWords.map((e) => getQuote(e)).toList();
  }

  EnglishToday getQuote(String noun) {
    Quote? quote;
    quote = Quotes().getByWord(noun);
    return EnglishToday(
      index: quote?.id,
      noun: noun,
      quote: quote?.content,
    );
  }

  String quoteHeading = Quotes().getRandom().content!;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _pageController = PageController(
        viewportFraction: 0.9); //Tao ti le pageview chp phep hien thi
    super.initState();
    getEnglishToday();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: appColors.secondColor,
      appBar: AppBar(
        backgroundColor: appColors.primaryColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            scaffoldKey.currentState?.openDrawer();
          },
          child: Image.asset(appAssets.menu),
        ),
        title: Text(
          "English Card",
          style: appStyles.h3.copyWith(color: appColors.textColor),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getEnglishToday();
          });
        },
        child: Image.asset(appAssets.exchange),
        backgroundColor: appColors.lightGrey,
      ),
      body: Container(
        // color: Colors.amber,
        // padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              // color: Colors.blue,
              height: size.height * 1 / 10,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '"$quoteHeading"',
                style: appStyles.h5
                    .copyWith(fontSize: 12, color: appColors.textColor),
              ),
            ),
            Container(
              height: size.height * 2 / 3,
              // color: Colors.amber,
              child: PageView.builder(
                  controller: _pageController, //Lay pageview hien tai
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex =
                          index; //Lay index cua pageview gan vo currentIndex
                      // print(currentIndex);
                    });
                  },
                  itemCount: words.length, //Số lương page
                  itemBuilder: (context, index) {
                    String firstLetter = words[index].noun != null
                        ? words[index].noun!
                        : ""; //Lay ky tu dau tien
                    firstLetter = firstLetter.substring(0, 1);
                    String leftLetter = words[index].noun != null
                        ? words[index].noun!
                        : ""; //Lay ky tu dau tien
                    leftLetter = leftLetter.substring(
                        1, leftLetter.length); //Lay ky tu con lai

                    String quoteDefault =
                        "Think of all the beauty still left around you and be happy";
                    String quote = words[index].quote != null
                        ? words[index].quote!
                        : quoteDefault;
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                            color: appColors.primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            boxShadow: [
                              BoxShadow(
                                  color: appColors.blackGrey,
                                  offset: Offset(1, 4),
                                  blurRadius: 3)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset(appAssets.heart),
                              alignment: Alignment.centerRight,
                            ),
                            RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    text: firstLetter,
                                    style: appStyles.h2.copyWith(
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(3, 10),
                                              blurRadius: 10.0)
                                        ]),
                                    children: [
                                      TextSpan(
                                        text: leftLetter,
                                        style: appStyles.h3.copyWith(
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              BoxShadow(
                                                  color: Colors.black38,
                                                  offset: Offset(3, 10),
                                                  blurRadius: 10.0)
                                            ]),
                                      ),
                                    ])),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                '"$quote"',
                                style: appStyles.h4.copyWith(
                                    color: Colors.black38, letterSpacing: 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),

            //indicator
            Container(
              height: size.height * 1 / 35,
              padding: const EdgeInsets.only(top: 5, left: 16),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, //So luong indicator
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildIndicator(index == currentIndex, size);
                  }),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: appColors.lightBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 16),
                child: Text(
                  'Your mind',
                  style: appStyles.h3.copyWith(color: appColors.textColor),
                ),
              ),
              appButton(label: 'Favorite', onTap: () {}),
              appButton(
                  label: 'Control',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ControlPage()));
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(bool isActive, Size size) {
    return Container(
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: isActive ? size.width * 1 / 5 : 24,
      decoration: BoxDecoration(
          color: isActive ? appColors.lightBlue : appColors.lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
                color: Colors.black38, offset: Offset(3, 10), blurRadius: 3)
          ]),
    );
  }
}
