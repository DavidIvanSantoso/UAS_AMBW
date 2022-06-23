import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:c14190040_01/dataclass.dart';

import '../dbservices.dart';

class Detail extends StatefulWidget {
  final String title;
  final String description;
  final String pubDate;
  final String thumbnail;
  final String link;
  const Detail(
      {Key? key,
      required this.title,
      required this.description,
      required this.pubDate,
      required this.thumbnail,
      required this.link})
      : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Image.network(
                      "${widget.thumbnail}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Text("${widget.title}"),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Text("${widget.description}"),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Text("${widget.pubDate}"),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Text("${widget.link}"),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                child: Icon(Icons.favorite),
                onPressed: () async {
                  try {
                    final dataPush = Post(
                        link: widget.link,
                        title: widget.title,
                        pubDate: widget.pubDate,
                        description: widget.description,
                        thumbnail: widget.thumbnail);
                    Database.tambahData(item: dataPush);
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
            Container(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  child: Icon(Icons.heart_broken),
                  onPressed: () {
                    Database.deleteData(judulId: widget.title);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
