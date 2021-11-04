import 'package:dogswelove/constants.dart';
import 'package:dogswelove/controllers/services.dart';
import 'package:dogswelove/models/dog.dart';
import 'package:dogswelove/views/components/card.dart';
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
        backgroundColor: episodef8Color,
        title: const Text(
          "Dogs We Love",
          style: H1Black,
        ),
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
                    return DogCard(
                      dog: data[index],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return const CircularProgressIndicator(
              color: episode666Color,
            );
          },
        ),
      ),
    );
  }
}
