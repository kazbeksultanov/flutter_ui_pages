import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      'FRINDES',
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(Color.fromRGBO(38, 119, 167, 1.0).value);
    return Container(
      height: size.height,
      width: size.width,
      color: colors['body_base'],
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 2.0,
              bottom: PreferredSize(
                child: Container(),
                preferredSize: Size(double.infinity, 18.0),
              ),
              backgroundColor: colors['panel_base'],
              centerTitle: true,
              leading: IconButton(
                padding: EdgeInsets.only(left: 18.0, top: 18.0),
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 40.0,
                ),
                onPressed: () {},
              ),
              actions: <Widget>[
                IconButton(
                  padding: EdgeInsets.only(right: 28.0, top: 18.0),
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            body: _buildTvItem(tvItems, context),
            bottomSheet: Container(
              decoration: BoxDecoration(
                color: colors['panel_base'],
              ),
              height: 70.0,
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
                      size: 40.0,
                    ),
                    onPressed: () {},
                  ),
                  Container(),
                  IconButton(
                    icon: Icon(
                      Icons.file_download,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: size.width / 2 - 50,
            top: 30,
            height: 100.0,
            width: 100.0,
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
                  size: 65.0,
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width / 2 - 50,
            bottom: 2.0,
            height: 100.0,
            width: 100.0,
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
                  size: 65.0,
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
      height: MediaQuery.of(context).size.height - 180,
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
    if (index % 2 == 0) {
      print(index);
      return Container(
        margin: EdgeInsets.only(top: 30.0),
        height: 135.0,
        width: double.infinity,
        alignment: Alignment.bottomLeft,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 12.0),
              height: 8.0,
              width: double.infinity,
              color: colors['body_selected'],
            ),
            Positioned(
              left: 12.0,
              height: 100.0,
              width: 180.0,
              child: Container(
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
            ),
            Positioned(
              left: 200.0,
              top: 10.0,
              height: 120.0,
              width: MediaQuery.of(context).size.width - 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.star,
                          color: tvItem.isFavourite ? Colors.yellow : Colors.white,
                          size: 28.0,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: tvItem.isNotified ? Colors.yellow : Colors.white,
                          size: 28.0,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.launch,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.file_download,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      tvItem.title,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: 'SF-Pro-Text-Regular',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Last Eposiode: ' + DateFormat.yMMMd().format(tvItem.lastEpisode),
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
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
                      fontSize: 14.0,
                      fontFamily: 'SF-Pro-Text-Regular',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(top: 30.0),
        height: 135.0,
        width: double.infinity,
        alignment: Alignment.bottomLeft,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 12.0),
              height: 8.0,
              width: double.infinity,
              color: colors['body_selected'],
            ),
            Positioned(
              left: 220.0,
              height: 100.0,
              width: 180.0,
              child: Container(
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
            ),
            Positioned(
              left: 12.0,
              top: 10.0,
              height: 120.0,
              width: MediaQuery.of(context).size.width - 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.star,
                          color: tvItem.isFavourite ? Colors.yellow : Colors.white,
                          size: 28.0,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: tvItem.isNotified ? Colors.yellow : Colors.white,
                          size: 28.0,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.launch,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.file_download,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      tvItem.title,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: 'SF-Pro-Text-Regular',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Last Eposiode: ' + DateFormat.yMMMd().format(tvItem.lastEpisode),
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
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
                      fontSize: 14.0,
                      fontFamily: 'SF-Pro-Text-Regular',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
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
