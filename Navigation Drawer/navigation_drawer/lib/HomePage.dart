// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:navigation_drawer/NavigationDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Card(
          child: CachedNetworkImage(
            imageUrl:
                "https://img.freepik.com/fotos-gratis/praia-do-norte-e-oceano-na-nazare-portugal_1268-14118.jpg?w=900&t=st=1662317694~exp=1662318294~hmac=7af1b1329466d2245857ebf227e9110c668f047976b9dcc848675ce7d01fa16d",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
