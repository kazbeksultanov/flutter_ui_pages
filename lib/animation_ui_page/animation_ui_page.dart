import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_ui_pages/animation_ui_page/models.dart';
import 'package:flutter_ui_pages/utils.dart';

class AnimationUiPage extends StatefulWidget {
  @override
  _AnimationUiPageState createState() => _AnimationUiPageState();
}

class _AnimationUiPageState extends State<AnimationUiPage> {
  var controller = PageController(initialPage: 0);

  double currentPage = 0.0;
  List<Picture> listPicture = [];
  int page = 0;

  var isLoading = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      currentPage = controller.page;
      setState(() {});
    });
    update2(currentPage);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            child: Icon(
              Icons.arrow_back,
              size: 32.0,
              color: Colors.white,
            ),
            heroTag: null,
            onPressed: () {
              controller.animateToPage(
                controller.page.round() - 1,
                duration: Duration(milliseconds: 1500),
                curve: ElasticOutCurve(1.2),
              );
            },
          ),
          SizedBox(width: hAdaptive(8.0, context)),
          FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            child: Icon(
              Icons.arrow_forward,
              size: 32.0,
              color: Colors.white,
            ),
            heroTag: null,
            onPressed: () {
              controller.animateToPage(
                controller.page.round() + 1,
                duration: Duration(milliseconds: 1500),
                curve: ElasticOutCurve(1.2),
              );
            },
          ),
        ],
      ),
      body: listPicture.length > 5
          ? Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.blueGrey,
                      Colors.indigo,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.mirror,
                  )),
                ),
                CirclesFlow(currentPage, listPicture, currentPage.round()),
                Positioned.fill(
                  child: PageView.builder(
                    controller: controller,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                ),
                Positioned(
                  left: wAdaptive(30.0, context),
                  bottom: hAdaptive(86, context),
                  child: Text(
                    listPicture[currentPage.round()].author,
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat-Medium',
                      fontSize: hAdaptive(24, context),
                      shadows: [
                        Shadow(
                          color: Colors.black87,
                          blurRadius: 8.0,
                          offset: Offset(8.0, 8.0),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: wAdaptive(30, context),
                  bottom: hAdaptive(26, context),
                  child: Padding(
                    padding: EdgeInsets.only(top: hAdaptive(8, context)),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(horizontal: wAdaptive(8, context)),
                      color: Colors.blueGrey[900],
                      child: Text(
                        'Go to picture web page',
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat-SemiBold',
                        ),
                      ),
                      onPressed: () async {
                        launchIfCan(listPicture[currentPage.round()].url);
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: hAdaptive(60, context)),
                    child: Text(
                      'Pictures',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: hAdaptive(100, context),
                        fontFamily: 'CURVED2',
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0, 0),
                            blurRadius: 50.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: hAdaptive(16, context),
                  ),
                  Text(
                    'Loading pictures from internet, wait few seconds please',
                    softWrap: true,
                  )
                ],
              ),
            ),
    );
  }

  Future update2(double index) async {
    index = index ?? 0;
    String url = 'https://picsum.photos/v2/list?page={0}&limit=10';
    if (listPicture.length <= index.round() + 10 && isLoading == false) {
      isLoading = true;
      var responce = await http.get(url.replaceAll('{0}', page.toString()));
      var r = jsonDecode(responce.body);
      for (var i = 0; i < 10; ++i) {
        var o = r[i];
        listPicture.add(Picture.fromJson(o));
      }
      page++;
      print('index: ${index.round()}');
      print('Page: $page');
      print('listPictures len: ${listPicture.length}');
      isLoading = false;
      setState(() {});
    }
  }
}

class CirclesFlow extends StatelessWidget {
  double index;
  int pageNumber;
  List<Picture> pictureList;

  List<Widget> items = [];

  CirclesFlow(this.index, this.pictureList, this.pageNumber);

  @override
  Widget build(BuildContext context) {
    index = index ?? 0;

    pictureList.forEach((pic) => items.add(diskSlice(index - items.length, pictureList.length, pic, pageNumber, context)));

    return Stack(children: items);
  }

  Widget diskSlice(double index, int number, Picture pic, int pageNumber, BuildContext context) {
    var trans;
    if (index < 0) {
      trans = Matrix4.translationValues(-index * wAdaptive(370, context), 0.0, 0.0);
    } else {
      trans = Matrix4.rotationX(index / 5);
    }
    var opacity = 1.0;
    if (index > 10) {
      opacity = 0.0;
    }
    return Opacity(
      opacity: opacity,
      child: Transform(
        origin: Offset(0.0, 0.0),
        transform: trans,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: hAdaptive(140, context)),
            height: hAdaptive(350, context),
            width: hAdaptive(350, context),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/id/${pic.id}/${hAdaptive(350, context).round()}/${hAdaptive(350, context).round()}'),
              ),
              border: Border.all(
                width: hAdaptive(8, context),
                color: Colors.blueGrey,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0.0, 0.0),
                  spreadRadius: 2.0,
                  blurRadius: 22.0,
                ),
              ],
            ),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      (pageNumber - index.round() + 1).toString(),
                      style: TextStyle(
                        fontSize: hAdaptive(26.0, context),
                        fontFamily: 'Montserrat-Bold',
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 8.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
