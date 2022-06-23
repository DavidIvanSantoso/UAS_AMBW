// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:c14190040_01/dataclass.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:c14190040_01/dbservices.dart';

class Like extends StatefulWidget {
  const Like({Key? key}) : super(key: key);

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  final TextEditingController filter = TextEditingController();
  @override
  void dispose() {
    filter.dispose();
    super.dispose();
  }

  @override
  void initState() {
    filter.addListener(onSearch);
    super.initState();
  }

  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {});
    return Database.getData(filter.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: Text("Like Page"),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: filter,
              decoration: InputDecoration(
                  filled: true,
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.lightBlueAccent),
                  )),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: onSearch(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error");
                } else if (snapshot.hasData || snapshot.data != null) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        DocumentSnapshot dsData = snapshot.data!.docs[index];
                        String lvJudul = dsData['title'];
                        String lvIsi = dsData['description'];
                        return ListTile(
                          title: Text(lvJudul),
                          subtitle: Text(lvIsi),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 8,
                          ),
                      itemCount: snapshot.data!.docs.length);
                }
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.purpleAccent,
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
