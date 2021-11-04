import 'package:dogswelove/controllers/services.dart';
import 'package:dogswelove/models/dog.dart';
import 'package:flutter/material.dart';

class DogsListPage extends StatefulWidget {
  const DogsListPage({Key? key}) : super(key: key);

  @override
  _DogsListPageState createState() => _DogsListPageState();
}

class _DogsListPageState extends State<DogsListPage> {
  late Future<List<Dog>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchDogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(""),
      ),
      body: Center(
        child: FutureBuilder<List<Dog>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Dog>? data = snapshot.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 75,
                      color: Colors.white,
                      child: Center(
                        child: Text(data[index].dogName),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
