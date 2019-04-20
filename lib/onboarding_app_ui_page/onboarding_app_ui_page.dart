import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_pages/onboarding_app_ui_page/data.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:flutter_ui_pages/onboarding_app_ui_page/page_indicator.dart';

class OnboardingAppUiPage extends StatefulWidget {
  @override
  _OnboardingAppUiPageState createState() => _OnboardingAppUiPageState();
}

class _OnboardingAppUiPageState extends State<OnboardingAppUiPage> with TickerProviderStateMixin {
  PageController _controller;
  AnimationController animationController;
  Animation<double> _scaleAnim;
  int currentPage = 0;
  bool lastPage = false;
  List animationList = [];

  var changeAnimation = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentPage);
    animationController = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _scaleAnim = Tween(begin: 0.6, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF485563),
            Color(0xFF29323C),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
          stops: [0.0, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: pageList.length,
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  if (currentPage == pageList.length - 1) {
                    lastPage = true;
                    animationController.forward();
                  } else {
                    lastPage = false;
                  }
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        var page = pageList[index];
                        var delta;
                        var y = 1.0;

                        if (_controller.position.haveDimensions) {
                          delta = _controller.page - index;
                          y = 1 - delta.abs().clamp(0.0, 1.0);
                        }
                        animationList = [
                          Matrix4.translationValues(0.0, 100 * (1 - y), 0.0),
                          Matrix4.diagonal3Values(y, y, 1.0),
                          Matrix4.rotationZ(1.2 * (1 - y)),
                          Matrix4.skew(0.0, (1 - y)),
                        ];
                        return ListView(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height - 200,
                              alignment: Alignment.center,
                              width: double.infinity,
                              child: Image.asset(page.imageUrl),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 12.0),
                              height: 100.0,
                              child: Stack(
                                children: <Widget>[
                                  Opacity(
                                    opacity: 0.1,
                                    child: Transform(
                                      transform: animationList[changeAnimation],
                                      child: GradientText(
                                        page.title,
                                        gradient: LinearGradient(colors: page.titleGradient),
                                        style: TextStyle(
                                          fontSize: 90.0,
                                          fontFamily: 'Montserrat-Black',
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20.0,
                                      left: 22.0,
                                    ),
                                    child: GradientText(
                                      page.title,
                                      gradient: LinearGradient(colors: page.titleGradient),
                                      style: TextStyle(
                                        fontSize: 70.0,
                                        fontFamily: 'Montserrat-Black',
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 12.0,
                                left: 34.0,
                              ),
                              child: Transform(
                                transform: animationList[changeAnimation],
                                child: Text(
                                  page.body,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Montserrat-Medium',
                                    color: Color(0xFF9B9B9B),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                          ],
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            Positioned(
              left: 30.0,
              bottom: 16.0,
              child: Container(
                width: 160.0,
                alignment: Alignment.bottomLeft,
                child: PageIndicator(
                  currentPage: currentPage,
                  pageCount: pageList.length,
                ),
              ),
            ),
            Positioned(
              right: 30.0,
              bottom: 16.0,
              child: ScaleTransition(
                scale: _scaleAnim,
                child: lastPage
                    ? FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      )
                    : Container(),
              ),
            ),
            Positioned(
              top: 30,
              left: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 28.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Container(
                      child: RaisedButton(
                    padding: EdgeInsets.all(2.0),
                    shape: CircleBorder(
                        side: BorderSide(
                      width: 2.0,
                      color: Colors.blue,
                    )),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        changeAnimation = Random().nextInt(animationList.length);
                      });
                    },
                    child: Tooltip(
                      preferBelow: true,
                      message: 'Tap to change text animation',
                      child: Icon(
                        Icons.whatshot,
                        size: 38.0,
                        color: Colors.black,
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
