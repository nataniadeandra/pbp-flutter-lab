
import 'package:counter_7/pages/watch_list_detail_page.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:flutter/material.dart';

import '../function/fetch_watch_list.dart';

class WatchListPage extends StatefulWidget {
    const WatchListPage({Key? key}) : super(key: key);

    @override
    State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {

  @override
  Widget build(Object context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: const DrawerApp(),
        body: FutureBuilder(
            future: fetchMyWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null)
              {
                return const Center(child: CircularProgressIndicator());
              }
              else
              {
                if (!snapshot.hasData)
                {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada watch list :(",
                        style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                }
                else
                {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(15.0),
                        border: futureWatchList[index].fields.watched
                          ? Border.all(color: Colors.greenAccent, width: 5) 
                          : Border.all(color: Colors.redAccent, width: 5),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WatchListDetailPage(
                                      title:
                                          futureWatchList[index].fields.title,
                                      watched:
                                          futureWatchList[index].fields.watched,
                                      rating:
                                          futureWatchList[index].fields.rating,
                                      releasedDate:
                                          futureWatchList[index].fields.releaseDate.toString(),
                                      review:
                                          futureWatchList[index].fields.review,
                                    ))),
                        child: Row(
                          children: [
                            Text(
                              "${snapshot.data![index].fields.title}",
                              style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              ),
                            ),
                            Checkbox(
                              checkColor: Colors.white,
                              value: futureWatchList[index].fields.watched,
                              onChanged: (bool? value) {
                                setState(() {
                                  futureWatchList[index].fields.watched = value!;
                                });
                              }
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
            }));
  }
}

