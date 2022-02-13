import 'package:flutter/material.dart';

import '../data/model.dart';

class SecondPage extends StatelessWidget {
  final List<Welcome> list;

  const SecondPage({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetched Data"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text(list[index].id.toString()),
                ),
                title: Text(list[index].title),
                subtitle: Text(list[index].body),
              ),
              const Divider(),
            ],
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
