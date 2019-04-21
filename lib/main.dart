import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_ui_pages/story_app_ui_page/story_app_ui_page.dart';
import 'package:flutter_ui_pages/adidas_shoes_ui_page/adidas_shoes_ui_page.dart';
import 'package:flutter_ui_pages/onboarding_app_ui_page/onboarding_app_ui_page.dart';
import 'package:flutter_ui_pages/favourites_ui_page/favourites_ui_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
//      home: UiPageList(),
      home: FavouritesUiPage(),
    );
  }
}

class UiPageList extends StatefulWidget {
  List<Page> pages = [
    Page(
      'Story App',
      'assets/story_app_ui_page/image_01.png',
      StoryAppUiPage(),
      'https://github.com/devefy/Flutter-Story-App-UI',
    ),
    Page(
      'Adidas Shoes Page',
      'assets/adidas_shoes_ui_page/preview.jpg',
      AdidasShoesUiPage(),
      'https://github.com/devefy/Flutter-Adidas-Shoes-Ecommerce-App-UI',
    ),
    Page(
      'Relax Page',
      'assets/onboarding_app_ui_page/illustration3.png',
      OnboardingAppUiPage(),
      'https://github.com/devefy/Flutter-Onboarding',
    ),
  ];

  @override
  _UiPageListState createState() => _UiPageListState();
}

class _UiPageListState extends State<UiPageList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/digital_pax_logo.png')),
            gradient: LinearGradient(
              tileMode: TileMode.repeated,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.brown, Colors.black87],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 16.0, top: 18.0),
                child: Text(
                  'DigitalPax Demo Apps',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    shadows: [
                      Shadow(
                        color: Colors.black38,
                        offset: Offset(10.0, 10.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: widget.pages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                offset: Offset(10.0, 10.0),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 200.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return widget.pages[index].page;
                              }));
                            },
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Image.asset(
                                  widget.pages[index].pictureAsset,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      widget.pages[index].name,
                                      softWrap: true,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black,
                                            offset: Offset(10.0, 10.0),
                                            blurRadius: 10.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 6.0, right: 8.0),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.info,
                                          color: Colors.white,
                                        ),
                                        onPressed: () async {
                                          if (await canLaunch(widget.pages[index].url)) {
                                            launch(widget.pages[index].url);
                                          }
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}

class Page {
  final String name;
  final String pictureAsset;
  final Widget page;
  final String url;

  Page(this.name, this.pictureAsset, this.page, this.url);
}
