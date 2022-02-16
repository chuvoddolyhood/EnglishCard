import 'package:englishcard/values/app_assets.dart';
import 'package:englishcard/values/app_colors.dart';
import 'package:englishcard/values/app_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appColors.secondColor,
      appBar: AppBar(
        backgroundColor: appColors.primaryColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {},
          child: Image.asset(appAssets.menu),
        ),
        title: Text(
          "English Card",
          style: appStyles.h3.copyWith(color: appColors.textColor),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('exchange');
        },
        child: Image.asset(appAssets.exchange),
        backgroundColor: appColors.lightGrey,
      ),
      body: Container(
        // color: Colors.amber,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              // color: Colors.blue,
              height: size.height * 1 / 10,
              alignment: Alignment.centerLeft,
              child: Text(
                '"It is amazing how complete the delusion that beauty is goodness"',
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
                  itemCount: 5, //Số lương page
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: appColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
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
                                  text: "B",
                                  style: appStyles.h1.copyWith(
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        BoxShadow(
                                            color: Colors.black38,
                                            offset: Offset(3, 10),
                                            blurRadius: 10.0)
                                      ]),
                                  children: [
                                    TextSpan(
                                      text: "eautiful",
                                      style: appStyles.h2.copyWith(
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
                              '"Think of all the beauty still left around you and be happy"',
                              style: appStyles.h4.copyWith(
                                  color: Colors.black38, letterSpacing: 1),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),

            //indicator
            Container(
              height: size.height * 1 / 35,
              padding: const EdgeInsets.only(top: 5),
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
