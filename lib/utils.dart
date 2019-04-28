import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

void launchIfCan(String url) async {
  if (await canLaunch(url)) {
    launch(url);
  }
}
