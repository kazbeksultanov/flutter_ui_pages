import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class FavouritesUiPage extends StatefulWidget {
  @override
  _FavouritesUiPageState createState() => _FavouritesUiPageState();
}

class _FavouritesUiPageState extends State<FavouritesUiPage> {
  Map<String, Color> colors = {
    'panel_base': Color(0xFF1497ED),
    'panel_icons': Color(0xFFebedef),
    'body_base': Color(0xFF14699F),
    'body_selected': Color(0xFF2D7BAA),
    'body_icon': Color(0xFFb8c0c6),
    'body_icon_selected': Color(0xFFF8DD1B),
  };

  List<TvItem> tvItems = [
    TvItem(
      'ALAN PARTRIDGE: THIS TIME',
      'assets/favourites_ui_page/tv1.jpg',
      true,
      false,
      DateTime(2019, 2, 3),
      DateTime(2019, 2, 10),
    ),
    TvItem(
      'GAME OF THRONES',
      'assets/favourites_ui_page/tv2.jpg',
      true,
      true,
      DateTime(2019, 2, 3),
      DateTime(2019, 2, 10),
    ),
    TvItem(
      'FRIENDS',
      'assets/favourites_ui_page/tv3.jpg',
      true,
      false,
      DateTime(2019, 2, 3),
      DateTime(2019, 2, 10),
    ),
    TvItem(
      'SIMPSONS',
      'assets/favourites_ui_page/tv4.jpg',
      true,
      false,
      DateTime(2019, 2, 3),
      DateTime(2019, 2, 10),
    ),
    TvItem(
      'GALACTICA',
      'assets/favourites_ui_page/tv5.jpg',
      false,
      false,
      DateTime(2019, 2, 3),
      DateTime(2019, 2, 10),
    ),
    TvItem(
      'BREAKING BAD',
      'assets/favourites_ui_page/tv6.jpg',
      true,
      true,
      DateTime(2019, 2, 3),
      DateTime(2019, 2, 10),
    ),
  ];

  var _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print('h: ' + size.height.toString() + ', w: ' + size.width.toString());
    return Container(
      height: size.height,
      width: size.width,
      color: colors['body_base'],
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Scaffold(
            key: _key,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 4.0,
              bottom: PreferredSize(
                child: Container(),
                preferredSize: Size(double.infinity, hAdaptive(18.0, context)),
              ),
              backgroundColor: colors['panel_base'],
              centerTitle: true,
              leading: IconButton(
                padding: EdgeInsets.only(left: hAdaptive(18.0, context), top: hAdaptive(18.0, context)),
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: hAdaptive(40.0, context),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text('Pressed drawer. Whant to go back?'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              child: Text('Yes'),
                            ),
                            FlatButton(
                              onPressed: () {Navigator.of(context).pop();},
                              child: Text('No'),
                            ),
                          ],
                        );
                      });
                },
              ),
              actions: <Widget>[
                IconButton(
                  padding: EdgeInsets.only(right: hAdaptive(28.0, context), top: hAdaptive(18.0, context)),
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: hAdaptive(40.0, context),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text('Pressed settings'),
                          );
                        });
                  },
                )
              ],
            ),
            body: _buildTvItem(tvItems, context),
            bottomSheet: Container(
              decoration: BoxDecoration(
                color: colors['panel_base'],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 3.0,
                    spreadRadius: 1.0,
                  )
                ],
              ),
              height: hAdaptive(70.0, context),
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.star,
                      color: Colors.white,
                      size: hAdaptive(40.0, context),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text('Pressed favourites list'),
                            );
                          });
                    },
                  ),
                  Container(),
                  IconButton(
                    icon: Icon(
                      Icons.file_download,
                      color: Colors.white,
                      size: hAdaptive(40.0, context),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text('Pressed download'),
                            );
                          });
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: size.width / 2 - hAdaptive(50.0, context),
            top: hAdaptive(30.0, context),
            height: hAdaptive(100.0, context),
            width: hAdaptive(100.0, context),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Pressed logo'),
                      );
                    });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: colors['panel_base'],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0.0, 0.0),
                      spreadRadius: 1.0,
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.live_tv,
                    color: Colors.white,
                    size: hAdaptive(65.0, context),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width / 2 - hAdaptive(50.0, context),
            bottom: hAdaptive(2.0, context),
            height: hAdaptive(100.0, context),
            width: hAdaptive(100.0, context),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Pressed account'),
                      );
                    });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: colors['panel_base'],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0.0, 0.0),
                      spreadRadius: 1.0,
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: hAdaptive(65.0, context),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildTvItem(List<TvItem> tvItemsList, BuildContext context) {
    return Container(
      height: hAdaptive(515, context),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: tvItemsList.length,
          itemBuilder: (context, index) {
            return makeTvItem(tvItemsList[index], index, context);
          }),
    );
  }

  makeTvItem(TvItem tvItem, int index, BuildContext context) {
    double iconSize = 28.0;
    if (index % 2 == 0) {
      return Container(
        margin: EdgeInsets.only(top: 20.0),
        width: double.infinity,
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Container(
              color: colors['body_selected'],
              margin: EdgeInsets.only(top: 10.0),
              height: hAdaptive(120.0, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(flex: 1, child: Container()),
                Expanded(
                    flex: 36,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0.0, 0.0),
                                spreadRadius: 1.0,
                                blurRadius: 3.0,
                              )
                            ],
                          ),
                          child: Image.asset(
                            tvItem.imageAsset,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    )),
                Expanded(flex: 2, child: Container()),
                Expanded(
                    flex: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(
                          height: hAdaptive(22.0, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tvItem.isFavourite ? tvItem.isFavourite = false : tvItem.isFavourite = true;
                                });
                              },
                              child: Icon(
                                Icons.star,
                                color: tvItem.isFavourite ? Colors.yellow : Colors.white,
                                size: hAdaptive(iconSize, context),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tvItem.isNotified ? tvItem.isNotified = false : tvItem.isNotified = true;
                                });
                              },
                              child: Icon(
                                Icons.notifications,
                                color: tvItem.isNotified ? Colors.yellow : Colors.white,
                                size: hAdaptive(iconSize, context),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                googleSearch(tvItem.title);
                              },
                              child: Icon(
                                Icons.launch,
                                color: Colors.white,
                                size: hAdaptive(iconSize, context),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text('Pressed download'),
                                      );
                                    });
                              },
                              child: Icon(
                                Icons.file_download,
                                color: Colors.white,
                                size: hAdaptive(iconSize, context),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: hAdaptive(16.0, context)),
                          child: Text(
                            tvItem.title,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: wAdaptive(14.0, context),
                              fontFamily: 'SF-Pro-Text-Regular',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: hAdaptive(8.0, context)),
                          child: Text(
                            'Last Eposiode: ' + DateFormat.yMMMd().format(tvItem.lastEpisode),
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: wAdaptive(14.0, context),
                              fontFamily: 'SF-Pro-Text-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          'Next Eposiode: ' + DateFormat.yMMMd().format(tvItem.nextEpisode),
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: wAdaptive(14.0, context),
                            fontFamily: 'SF-Pro-Text-Regular',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
                Expanded(flex: 1, child: Container()),
              ],
            )
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(top: 20.0),
        width: double.infinity,
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Container(
              color: colors['body_selected'],
              margin: EdgeInsets.only(top: 10.0),
              height: hAdaptive(120.0, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(flex: 1, child: Container()),
                Expanded(
                    flex: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(
                          height: hAdaptive(22.0, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tvItem.isFavourite ? tvItem.isFavourite = false : tvItem.isFavourite = true;
                                });
                              },
                              child: Icon(
                                Icons.star,
                                color: tvItem.isFavourite ? Colors.yellow : Colors.white,
                                size: hAdaptive(iconSize, context),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tvItem.isNotified ? tvItem.isNotified = false : tvItem.isNotified = true;
                                });
                              },
                              child: Icon(
                                Icons.notifications,
                                color: tvItem.isNotified ? Colors.yellow : Colors.white,
                                size: hAdaptive(iconSize, context),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                googleSearch(tvItem.title);
                              },
                              child: Icon(
                                Icons.launch,
                                color: Colors.white,
                                size: hAdaptive(iconSize, context),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text('Pressed download'),
                                      );
                                    });
                              },
                              child: Icon(
                                Icons.file_download,
                                color: Colors.white,
                                size: hAdaptive(iconSize, context),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: hAdaptive(16.0, context)),
                          child: Text(
                            tvItem.title,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: wAdaptive(14.0, context),
                              fontFamily: 'SF-Pro-Text-Regular',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: hAdaptive(8.0, context)),
                          child: Text(
                            'Last Eposiode: ' + DateFormat.yMMMd().format(tvItem.lastEpisode),
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: wAdaptive(14.0, context),
                              fontFamily: 'SF-Pro-Text-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          'Next Eposiode: ' + DateFormat.yMMMd().format(tvItem.nextEpisode),
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: wAdaptive(14.0, context),
                            fontFamily: 'SF-Pro-Text-Regular',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
                Expanded(flex: 2, child: Container()),
                Expanded(
                    flex: 36,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0.0, 0.0),
                                spreadRadius: 1.0,
                                blurRadius: 3.0,
                              )
                            ],
                          ),
                          child: Image.asset(
                            tvItem.imageAsset,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    )),
                Expanded(flex: 1, child: Container()),
              ],
            )
          ],
        ),
      );
    }
  }
}

class TvItem {
  String title;
  DateTime lastEpisode;
  DateTime nextEpisode;
  String imageAsset;
  bool isFavourite;
  bool isNotified;

  TvItem(
    this.title,
    this.imageAsset,
    this.isFavourite,
    this.isNotified,
    this.lastEpisode,
    this.nextEpisode,
  );
}

double wAdaptive(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.width / 411.428;
}

double hAdaptive(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / 684.43;
}

void googleSearch(String str) async {
  if (await canLaunch('https://www.google.com')) {
    str.replaceAll(' ', '+');
    launch('https://www.google.com/search?q=$str&oq=$str');
  }
}
