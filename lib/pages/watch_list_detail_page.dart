import 'dart:html';

import 'package:counter_7/pages/watch_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/drawer.dart';

class WatchListDetailPage extends StatelessWidget {
  final String title;
  final bool watched;
  final int rating;
  final String releasedDate;
  final String review;

  const WatchListDetailPage(
      {Key? key,
      required this.title,
      required this.watched,
      required this.rating,
      required this.releasedDate,
      required this.review})
      : super(key: key);

  showWatched() {
    if (watched == true) {
      return const Text('Status: watched',
        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15)
      );

    } else {
      return const Text('Status: not watched',
        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            'My Watch List',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: Colors.black54,
            ),
          ),
        ),
      drawer: DrawerApp(),
      body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Text(
            "Released Date: " + releasedDate,
            style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Colors.black),
          ),
          Text(
            "Rating: " + rating.toString() + "/5",
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          ),
          showWatched(),
          Text(
            "Review: " + review,
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          ),
          const Spacer(),

          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WatchListPage()),
              );
                },
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
          )

        ],
      ),
  
      
      
    ));
  }
}