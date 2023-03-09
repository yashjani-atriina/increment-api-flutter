import 'package:counterapis/models/users_model.dart';
import 'package:counterapis/services/api_call.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0, listSize = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: FutureBuilder<Users>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            listSize = snapshot.data!.data.length;
            return ListView.builder(
              itemCount: _counter, //== 0 ? 1 : _counter,
              itemBuilder: (context, counter) {
                // print(listSize);
                return Card(
                  child: ListTile(
                    leading: Text(snapshot.data!.data[counter].id.toString()),
                    title: Text(snapshot.data!.data[counter].firstName),
                    subtitle: Text(snapshot.data!.data[counter].lastName),
                    trailing: Text(snapshot.data!.data[counter].email),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_counter == listSize) _counter = -1;
          _incrementCounter();
          // print(_counter);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
