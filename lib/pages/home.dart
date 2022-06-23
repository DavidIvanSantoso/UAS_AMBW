import 'package:c14190040_01/dataclass.dart';
import 'package:c14190040_01/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../apiservices.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Service serviceAPI = Service();
  late Future<Welcome> listData;
  @override
  void initState() {
    // TODO: implement initState
    listData = serviceAPI.getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: FutureBuilder<Welcome>(
          future: listData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Welcome isiData = snapshot.data!;
              List<Post> isiPost = isiData.data.posts;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detail(
                                      title: isiPost[index].title,
                                      description: isiPost[index].description,
                                      pubDate: isiPost[index].pubDate,
                                      thumbnail: isiPost[index].thumbnail,
                                      link: isiPost[index].link,
                                    )));
                      },
                      title: Text(isiPost[index].title),
                      subtitle: Text(isiPost[index].description),
                      leading: Image.network(isiPost[index].thumbnail),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
