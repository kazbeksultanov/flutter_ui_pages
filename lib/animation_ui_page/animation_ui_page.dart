import 'package:flutter/material.dart';

class AnimationUiPage extends StatefulWidget {
  @override
  _AnimationUiPageState createState() => _AnimationUiPageState();
}

var col = [
  Colors.black,
  Colors.blueGrey,
  Colors.amber,
  Colors.blueAccent,
  Colors.amberAccent,
  Colors.tealAccent,
  Colors.teal,
  Colors.deepOrange,
  Colors.deepOrangeAccent,
  Colors.yellowAccent,
  Colors.yellow,
  Colors.indigo,
];

class _AnimationUiPageState extends State<AnimationUiPage> {
  var controller = PageController(initialPage: 0);

  var currentPage;

  @override
  void dispose() {
    controller.dispose(); // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      currentPage = controller.page;
      setState(() {});
    });
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
              child: Icon(Icons.arrow_back),
              heroTag: null,
              onPressed: () {
                controller.animateToPage(
                  controller.page.round() - 1,
                  duration: Duration(milliseconds: 1500),
                  curve: ElasticOutCurve(1.2),
                );
              }),
          SizedBox(width: 8.0),
          FloatingActionButton(
              child: Icon(Icons.arrow_forward),
              heroTag: null,
              onPressed: () {
                controller.animateToPage(
                  controller.page.round() + 1,
                  duration: Duration(milliseconds: 1500),
                  curve: ElasticOutCurve(1.2),
                );
              }),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CirclesFlow(currentPage),
          Positioned.fill(
            child: PageView.builder(
              controller: controller,
              itemBuilder: (context, index) {
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}

class CirclesFlow extends StatelessWidget {
  double index;

  CirclesFlow(this.index);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    index = index ?? 0;
    return Stack(
      children: <Widget>[
        diskSlice(index),
        diskSlice(index-1),
        diskSlice(index-2),
        diskSlice(index-3),
        diskSlice(index-4),
      ],
    );
  }
}



Widget diskSlice(double index) {
  var trans;
  if(index < 0){
    trans = Matrix4.translationValues(-index*370.0, 0.0, 0.0);
  } else {
    trans = Matrix4.rotationX(index/2);
  }
  return Transform(
    origin: Offset(0.0, 0.0),
    transform: trans,
    child: Container(
      margin: EdgeInsets.all(30),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blueAccent,
        border: Border.all(
          width: 8.0,
          color: Colors.blueGrey,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0.0, 0.0),
            spreadRadius: 2.0,
            blurRadius: 22.0,
          ),
        ],
      ),
      child: Text(
        '${index.toStringAsPrecision(3)}',
        style: TextStyle(
          color: Colors.white,
          fontSize: 48.0,
          fontFamily: 'Montserrat-Bold',
          shadows: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 8.0,
              blurRadius: 20.0,
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
      ),
    ),
  );
}
